from app import create_app
from app.conexion import db
from app.models.usuarios import Usuario
from werkzeug.security import generate_password_hash

app = create_app()

with app.app_context():
    # Crea una contraseña de prueba cifrada
    hashed_password = generate_password_hash('Danna', method='sha256')
    test_user = Usuario(username='patricia', password=hashed_password)
    db.session.add(test_user)
    db.session.commit()
    print("Usuario de prueba agregado.")
