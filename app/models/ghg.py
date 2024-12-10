from werkzeug.security import check_password_hash, generate_password_hash

# Genera un hash para una contraseña
password = 'mama'
hashed_password = generate_password_hash(password)
print(f'Hashed Password: {hashed_password}')

# Verifica la contraseña
is_correct = check_password_hash(hashed_password, 'mama')
print(f'Password is correct: {is_correct}')  # Debería imprimir True
