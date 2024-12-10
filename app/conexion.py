from flask_sqlalchemy import SQLAlchemy

# Instancia de SQLAlchemy para la aplicación Flask
db = SQLAlchemy()

def crear_conexion(host_name, user_name, user_password, db_name):
    import mysql.connector
    from mysql.connector import Error

    conexion = None
    try:
        conexion = mysql.connector.connect(
            host=host_name,
            user=user_name,
            password=user_password,
            database=db_name
        )
        print("Conexión exitosa a la base de datos")
    except Error as e:
        print(f"Error '{e}' durante la conexión a la base de datos")
    return conexion
