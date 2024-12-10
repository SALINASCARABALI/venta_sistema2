// Esperar a que el DOM esté listo
document.addEventListener('DOMContentLoaded', function() {
    // Agregar un mensaje de bienvenida
    const welcomeMessage = document.createElement('p');
    welcomeMessage.textContent = '¡Bienvenido a nuestro sistema de ventas!';
    document.querySelector('main').appendChild(welcomeMessage);

    // Ejemplo de función para manejar clics en los enlaces de navegación
    const navLinks = document.querySelectorAll('nav a');
    navLinks.forEach(link => {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            alert(`Navegando a: ${this.textContent}`);
        });
    });
});
