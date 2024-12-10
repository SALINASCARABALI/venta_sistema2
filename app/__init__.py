from flask import Flask
from app.config import Config
from app.conexion import db
from flask_login import LoginManager

login_manager = LoginManager()
login_manager.login_view = 'main.login'

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    db.init_app(app)  # Inicializa la base de datos aquí
    login_manager.init_app(app)

    from app.routes import main as main_blueprint
    app.register_blueprint(main_blueprint)

    with app.app_context():
        db.create_all()

    return app

@login_manager.user_loader
def load_user(user_id):
    from app.models.usuarios import Usuario
    return Usuario.query.get(int(user_id))
