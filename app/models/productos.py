from app.conexion import db

print(f"Definiendo tabla productos en {__name__}")  # Agregar esto

class Producto(db.Model):
    __tablename__ = 'productos'
    __table_args__ = {'extend_existing': True}

    id_producto = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(100), nullable=False)
    descripcion = db.Column(db.Text)
    precio = db.Column(db.Float, nullable=False)
    stock = db.Column(db.Integer, nullable=False)

    def __init__(self, nombre, descripcion, precio, stock):
        self.nombre = nombre
        self.descripcion = descripcion
        self.precio = precio
        self.stock = stock

    def __repr__(self):
        return f'<Producto {self.nombre}>'

    def formatear_precio(self):
        """
        Formatea el precio del producto en pesos colombianos.
        Ejemplo: 20000 -> "$20.000,00"
        """
        return "${:,.2f}".format(self.precio).replace(',', 'X').replace('.', ',').replace('X', '.')

    def calcular_total_venta(self, cantidad, tasa_cambio=1):
        """
        Calcula el total de la venta en pesos colombianos.
        
        :param cantidad: La cantidad de productos vendidos.
        :param tasa_cambio: La tasa de cambio de la moneda base a pesos colombianos (por defecto: 1, ya que el precio ya está en pesos).
        :return: El total de la venta en pesos colombianos formateado.
        """
        total = self.precio * cantidad  # Total en la moneda base
        # Formatear el total en pesos colombianos
        return "${:,.2f}".format(total).replace(',', 'X').replace('.', ',').replace('X', '.')
