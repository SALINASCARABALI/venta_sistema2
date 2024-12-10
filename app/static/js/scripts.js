document.addEventListener('DOMContentLoaded', function() {
    console.log('Scripts cargados correctamente.');

    // Referencias a los elementos del formulario y la lista de ventas
    const ventaForm = document.getElementById('ventaForm');
    const ventasList = document.getElementById('ventasList');
    const clearButton = document.getElementById('clearScreenButton');

    // Función para limpiar el formulario
    function limpiarFormulario() {
        ventaForm.reset();
        document.getElementById('nombre').value = ''; // Limpiar el campo oculto 'nombre'
    }

    // Función para limpiar la lista de ventas
    function limpiarListaVentas() {
        ventasList.innerHTML = "";  // Esto vacía la lista de ventas en pantalla
    }

    // Evento para el botón de limpiar pantalla
    clearButton.addEventListener('click', function() {
        limpiarFormulario();
        limpiarListaVentas();
    });
});
