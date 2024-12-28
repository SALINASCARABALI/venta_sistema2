from flask import Blueprint, render_template, request, redirect, url_for, flash, jsonify, make_response, current_app
from flask_login import login_user, logout_user, login_required
from werkzeug.security import check_password_hash, generate_password_hash
from datetime import datetime
from app.conexion import db
from app.models.ventas import Venta
from app.models.productos import Producto
from app.models.proveedores import Proveedor
from app.models.usuarios import Usuario
from app.models.clientes import Cliente
from app.models.impresion_factura import Factura, DetalleFactura
from flask_mail import Message, Mail
from weasyprint import HTML
import json
import os
from flask import jsonify
import logging

main = Blueprint('main', __name__)

# Configuración de Flask-Mail
mail = Mail()

@main.route('/')
@login_required
def home():
    return render_template('index.html')

@main.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        user = Usuario.query.filter_by(username=username).first()
        if user and check_password_hash(user.password, password):
            login_user(user)
            return redirect(url_for('main.home'))
        else:
            flash('Nombre de usuario o contraseña incorrectos.')
    return render_template('login.html')

@main.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        if Usuario.query.filter_by(username=username).first():
            flash('El nombre de usuario ya está en uso.')
            return redirect(url_for('main.register'))
        hashed_password = generate_password_hash(password, method='scrypt')
        new_user = Usuario(username=username, password=hashed_password)
        db.session.add(new_user)
        db.session.commit()
        flash('Usuario registrado exitosamente.')
        return redirect(url_for('main.login'))
    return render_template('register.html')

@main.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('main.login'))



@main.route('/ventas', methods=['GET', 'POST'])
@login_required
def ventas_page():
    if request.method == 'GET':
        productos = Producto.query.all()
        return render_template('ventas.html', productos=productos)

    if request.method == 'POST':
        try:
            data = request.get_json()
            if not data:
                raise ValueError("No se recibieron datos")

            productos = data.get('productos')
            nombre_cliente = data.get('cliente')
            email_cliente = data.get('email')
            whatsapp_cliente = data.get('whatsapp')

            if not productos or not nombre_cliente or not email_cliente or not whatsapp_cliente:
                raise ValueError("Faltan datos de la venta")

            cliente = Cliente.query.filter_by(email=email_cliente).first()  # Usar `email` en lugar de `correo`
            if not cliente:
                cliente = Cliente(nombre=nombre_cliente, email=email_cliente, whatsapp=whatsapp_cliente)
                db.session.add(cliente)

            total_venta = 0
            for producto in productos:
                producto_id = producto['id']
                nombre = producto['nombre']
                cantidad = producto['cantidad']
                precio = producto['precio']

                producto_obj = Producto.query.get(producto_id)
                if producto_obj and producto_obj.stock >= cantidad:
                    total_producto = cantidad * precio
                    total_venta += total_producto
                    nueva_venta = Venta(id_producto=producto_id, nombre=nombre, cantidad=cantidad, precio=precio)
                    producto_obj.stock -= cantidad
                    db.session.add(nueva_venta)
                else:
                    return jsonify({'error': f'No hay suficiente stock para {nombre}. Quedan {producto_obj.stock} unidades.'})

            db.session.commit()

            factura_data = {
                'productos': productos,
                'total': total_venta,
                'cliente': {'nombre': cliente.nombre, 'email': email_cliente, 'whatsapp': whatsapp_cliente},  # Usar `email`
                'fecha': datetime.now().strftime('%Y-%m-%d %H:%M:%S')
            }
            return jsonify({'redirect': url_for('main.impresion_factura', factura_data=json.dumps(factura_data))})
        except Exception as e:
            db.session.rollback()
            current_app.logger.error('Error al registrar la venta: %s', e)
            return jsonify({'error': str(e)}), 400



import os

@main.route('/clientes')
def clientes_page():
    print(os.path.abspath('templates/clientes.html'))
    clientes = Cliente.query.all()
    return render_template('clientes.html', clientes=clientes)

@main.route('/impresion_factura')
def impresion_factura():
    try:
        factura_data = json.loads(request.args.get('factura_data'))
        productos = factura_data['productos']
        total = factura_data['total']
        cliente = factura_data['cliente']
        fecha = factura_data['fecha']

        return render_template('impresion_factura.html', productos=productos, total=total, cliente=cliente, fecha=fecha)
    except Exception as e:
        current_app.logger.error('Error al generar la factura: %s', e)
        return render_template('error.html', mensaje='Error al generar la factura.')

@main.route('/download_pdf/<int:venta_id>')
def download_pdf(venta_id):
    venta = Venta.query.get_or_404(venta_id)
    html = render_template('impresion_factura.html', venta=venta)
    pdf = HTML(string=html).write_pdf()

    response = make_response(pdf)
    response.headers['Content-Type'] = 'application/pdf'
    response.headers['Content-Disposition'] = 'inline; filename=Factura.pdf'
    return response


@main.route('/productos', methods=['GET', 'POST'])
@login_required
def productos_page():
    if request.method == 'POST':
        # Obtener los valores de los campos del formulario
        nombre = request.form['nombre']
        cantidad = request.form.get('cantidad')
        precio = request.form.get('precio')

        # Validar que los campos no estén vacíos
        if not nombre or not cantidad or not precio:
            flash('Todos los campos son obligatorios.', 'error')
            return redirect(request.url)

        # Validar que la cantidad sea un número entero
        try:
            cantidad = int(cantidad)
        except ValueError:
            flash('La cantidad debe ser un número entero.', 'error')
            return redirect(request.url)

        # Procesar y validar el precio correctamente
        try:
            # Eliminar puntos como separadores de miles y reemplazar la coma por un punto
            precio = float(precio.replace('.', '').replace(',', '.'))
        except ValueError:
            flash('El precio debe ser un número válido.', 'error')
            return redirect(request.url)

        # Crear el nuevo producto
        nuevo_producto = Producto(nombre=nombre, descripcion='', precio=precio, stock=cantidad)
        db.session.add(nuevo_producto)
        db.session.commit()

        flash('Producto agregado con éxito.', 'success')

    # Obtener la lista de productos para mostrar en la plantilla
    productos_list = Producto.query.all()
    return render_template('productos.html', productos=productos_list)


@main.route('/buscar_producto', methods=['GET'])
def buscar_producto():
    try:
        nombre_producto = request.args.get('nombre')
        if not nombre_producto:
            return jsonify({'error': 'Nombre del producto no proporcionado'}), 400

        producto = Producto.query.filter_by(nombre=nombre_producto).first()
        if not producto:
            return jsonify({'error': 'Producto no encontrado'}), 404

        return jsonify({
            'id_producto': producto.id_producto,
            'nombre': producto.nombre,
            'precio': producto.precio,
            'stock': producto.stock
        })
    except Exception as e:
        current_app.logger.error('Error al buscar el producto: %s', e)
        return jsonify({'error': 'Error al buscar el producto'}), 500


@main.route('/proveedores', methods=['GET', 'POST'])
@login_required
def proveedores_page():
    if request.method == 'POST':
        nombre = request.form.get('nombre')
        contacto = request.form.get('contacto')
        correo = request.form.get('email')  # Ajusta aquí también a 'correo'

        # Validar que todos los campos están presentes
        if not nombre or not contacto or not correo:
            flash('Todos los campos son obligatorios.', 'error')
            return redirect(request.url)

        try:
            # Crear y guardar un nuevo proveedor
            nuevo_proveedor = Proveedor(nombre=nombre, contacto=contacto, correo=correo)
            db.session.add(nuevo_proveedor)
            db.session.commit()
            flash('Proveedor agregado con éxito.')
        except Exception as e:
            db.session.rollback()
            logging.error(f"Error al agregar proveedor: {str(e)}")
            flash(f"Error al agregar proveedor: {str(e)}", 'error')
    
    proveedores_list = Proveedor.query.all()
    return render_template('proveedores.html', proveedores=proveedores_list)
