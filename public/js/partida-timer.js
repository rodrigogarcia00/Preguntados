const timer = document.getElementById("timer");
const form = document.getElementById("form-respuesta");

if (timer && form) {
    let segundos = Number(timer.dataset.tiempo);

    function actualizarTimer() {
        timer.textContent = "00:" + String(segundos).padStart(2, "0");
    }

    actualizarTimer();

    const intervalo = setInterval(function () {
        segundos--;

        actualizarTimer();

        if (segundos <= 0) {
            clearInterval(intervalo);
            form.submit();
        }
    }, 1000);
}