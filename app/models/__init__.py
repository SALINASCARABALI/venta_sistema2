from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

def create_app():
    app = Flask(__name__)
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://usuario:contraseña@localhost/db_name'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    db.init_app(app)

    with app.app_context():
        from app.models import Cliente, Factura, DetalleFactura, Producto, Venta, Proveedor, Usuario
        db.create_all()

    return app

from .login import UserAuth

# app/models/__init__.py

from .impresion_factura import Cliente, Factura, DetalleFactura  # Asegúrate de que los nombres sean correctos
from .ventas import Venta
from .productos import Producto
from .proveedores import Proveedor
from .usuarios import Usuario
from .clientes import Cliente