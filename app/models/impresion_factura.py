from app.conexion import db
from app.models.clientes import Cliente # Asegúrate de que solo la importas aquí una vez

# Modelo Factura
class Factura(db.Model):
    __tablename__ = 'facturas'

    id = db.Column(db.Integer, primary_key=True)
    numero = db.Column(db.String(50), nullable=False, unique=True)
    fecha = db.Column(db.Date, nullable=False)
    cliente_id = db.Column(db.Integer, db.ForeignKey('clientes.id'), nullable=False)

    cliente = db.relationship('Cliente', backref='facturas', lazy=True)
    detalles = db.relationship('DetalleFactura', backref='factura', lazy=True)

    def __init__(self, numero, fecha, cliente_id):
        self.numero = numero
        self.fecha = fecha
        self.cliente_id = cliente_id

    def __repr__(self):
        return f'<Factura N° {self.numero}>'

# Modelo DetalleFactura
class DetalleFactura(db.Model):
    __tablename__ = 'detalle_factura'

    id = db.Column(db.Integer, primary_key=True)
    factura_id = db.Column(db.Integer, db.ForeignKey('facturas.id'), nullable=False)
    producto = db.Column(db.String(100), nullable=False)
    cantidad = db.Column(db.Integer, nullable=False)
    precio = db.Column(db.Float, nullable=False)
    total = db.Column(db.Float, nullable=False)

    def __init__(self, factura_id, producto, cantidad, precio):
        self.factura_id = factura_id
        self.producto = producto
        self.cantidad = cantidad
        self.precio = precio
        self.total = cantidad * precio

    def __repr__(self):
        return f'<DetalleFactura {self.producto} - Cantidad: {self.cantidad} - Total: ${self.total}>'
