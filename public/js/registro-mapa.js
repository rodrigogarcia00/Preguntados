document.addEventListener("DOMContentLoaded", function () {
    const mapaContenedor = document.getElementById("mapa-registro");

    if (!mapaContenedor) {
        return;
    }

    const mapa = L.map("mapa-registro").setView([-34.6708, -58.5628], 13);

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        attribution: "© OpenStreetMap"
    }).addTo(mapa);

    let marcador = null;

    mapa.on("click", function (e) {
        const latitud = e.latlng.lat;
        const longitud = e.latlng.lng;

        document.getElementById("latitud").value = latitud;
        document.getElementById("longitud").value = longitud;

        if (marcador) {
            marcador.setLatLng(e.latlng);
        } else {
            marcador = L.marker(e.latlng).addTo(mapa);
        }
    });
});