from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from flask_mail import Mail, Message
from .app.models.usuarios import Usuario

# Crear la aplicación
app = Flask(__name__)
app.secret_key = 'supersecretkey'

# Configurar la base de datos
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:proyectotecnologia@localhost/sistema_ventas'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Configurar Flask-Mail
app.config['MAIL_SERVER'] = 'smtp.your-email.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USERNAME'] = 'your-email@example.com'
app.config['MAIL_PASSWORD'] = 'your-email-password'

# Inicializar la base de datos y mail
db = SQLAlchemy(app)
mail = Mail(app)

# Configuración de Flask-Login
login_manager = LoginManager()
login_manager.login_view = 'main.login'
login_manager.init_app(app)

# Registrar el filtro para formatear monedas
@app.template_filter('format_currency')
def format_currency(value):
    print("Registrando el filtro format_currency")
    if value is None:
        return ''
    return "${:,.2f}".format(value).replace(',', 'X').replace('.', ',').replace('X', '.')

# Imprimir los filtros disponibles para depuración
print("Filtros disponibles en Jinja2:")
print(app.jinja_env.filters)

# Función para cargar un usuario
@login_manager.user_loader
def load_user(user_id):
    return Usuario.query.get(int(user_id))

# Importar y registrar las rutas
from app.routes import main as main_blueprint
app.register_blueprint(main_blueprint)

# Crear tablas si no existen
with app.app_context():
    db.create_all()

if __name__ == '__main__':
    app.run(debug=True, port=5000)
