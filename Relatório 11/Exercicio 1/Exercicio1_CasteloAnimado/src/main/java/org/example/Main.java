package org.example;

public class Main {

    public static void main(String[] args) {

        Morador m1 = new Mago("Howl", "transformação em pássaro");
        Morador m2 = new DemonioDoFogo("Calcifer");

        m1.apresentar();
        m2.apresentar();

        // Morador generico = new Morador("Fulano"); // erro: Morador é abstrata, não compila
    }
}
