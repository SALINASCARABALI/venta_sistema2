from app.conexion import db

class Proveedor(db.Model):
    __tablename__ = 'proveedores'
    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(100), nullable=False)
    contacto = db.Column(db.String(100), nullable=False)
    correo = db.Column(db.String(100), nullable=False)

    def __init__(self, nombre, contacto, correo):
        self.nombre = nombre
        self.contacto = contacto
        self.correo = correo  # Cambié 'email' a 'correo' para que coincida con el nombre de la columna

    @staticmethod
    def registrar_proveedor(nombre, contacto, correo):
        proveedor = Proveedor(nombre, contacto, correo)
        db.session.add(proveedor)
        db.session.commit()
        return "Proveedor registrado exitosamente."

    @staticmethod
    def mostrar_proveedores():
        return Proveedor.query.all()

    def save(self):
        db.session.add(self)
        db.session.commit()
