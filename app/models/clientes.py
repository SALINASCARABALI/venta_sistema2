from app.conexion import db

class Cliente(db.Model):
    __tablename__ = 'clientes'

    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(100), nullable=False)
    correo = db.Column(db.String(100), nullable=False, unique=True)  # Asegúrate de que este campo existe
    whatsapp = db.Column(db.String(15), nullable=True)

    def __init__(self, nombre, correo, whatsapp=None):
        self.nombre = nombre
        self.correo = correo
        self.whatsapp = whatsapp

    def __repr__(self):
        return f'<Cliente {self.nombre}>'
