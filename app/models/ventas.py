from datetime import datetime
from app import db
from .productos import Producto

class Venta(db.Model):
    __tablename__ = 'ventas'
    id = db.Column(db.Integer, primary_key=True)
    id_producto = db.Column(db.Integer, db.ForeignKey('productos.id_producto'), nullable=False)
    nombre = db.Column(db.String(100), nullable=False)
    cantidad = db.Column(db.Integer, nullable=False)
    precio = db.Column(db.Float, nullable=False)
    total = db.Column(db.Float, nullable=False)  # Cambiado a Float para mantener el formato
    fecha = db.Column(db.Date, nullable=False)
    hora = db.Column(db.Time, nullable=False)

    producto = db.relationship('Producto', backref=db.backref('ventas', lazy=True))

    def __init__(self, id_producto, nombre, cantidad, precio):
        self.id_producto = id_producto
        self.nombre = nombre
        self.cantidad = cantidad
        self.precio = precio

        # Calcula el total de la venta en pesos colombianos usando el método del producto
        self.total = cantidad * precio

        # Fecha y hora actuales
        now = datetime.now()
        self.fecha = now.date()
        self.hora = now.time()

    def __repr__(self):
        return f'<Venta {self.id} - {self.nombre}>'
