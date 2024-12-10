from werkzeug.security import generate_password_hash, check_password_hash
from app.models.usuarios import Usuario
from app import db

class UserAuth:
    def __init__(self, username, password):
        self.username = username
        self.password = generate_password_hash(password)

    def save_to_db(self):
        new_user = Usuario(username=self.username, password=self.password)
        db.session.add(new_user)
        db.session.commit()

    @staticmethod
    def login(username, password):
        # Busca al usuario en la base de datos
        user = Usuario.query.filter_by(username=username).first()
        if user and check_password_hash(user.password, password):
            return user  # Devuelve el usuario si la autenticación es exitosa
        else:
            return None  # De
