from werkzeug.security import generate_password_hash
import mysql.connector

# Función para conectarse a la base de datos
def conectar_bd():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="sistema_ventas"
    )

# Función para actualizar la contraseña en la base de datos
def actualizar_contrasena(usuario, nueva_contrasena):
    hashed_password = generate_password_hash(nueva_contrasena)
    print(f"Hashed Password: {hashed_password}")  # Imprime el hash generado
    conexion = conectar_bd()
    cursor = conexion.cursor()

    sql = "UPDATE usuarios SET password = %s WHERE username = %s"
    valores = (hashed_password, usuario)

    cursor.execute(sql, valores)
    conexion.commit()

    cursor.close()
    conexion.close()
    print(f"Contraseña actualizada para el usuario {usuario}")

# Actualizar contraseña para un usuario específico
actualizar_contrasena("patricia", "Danna")
