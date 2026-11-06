package org.example;

public class Main {

    public static void main(String[] args) {

        Alienigena alien = new Alienigena("Serpo");
        EspiritoYoukai espirito = new EspiritoYoukai("Turbo Vovó");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();
        mapa.registrar("Túnel abandonado", espirito);
        mapa.registrar("Campo de milho", alien);

        mapa.investigar("Túnel abandonado");
        mapa.investigar("Campo de milho");
        mapa.investigar("Praça central");
    }
}
