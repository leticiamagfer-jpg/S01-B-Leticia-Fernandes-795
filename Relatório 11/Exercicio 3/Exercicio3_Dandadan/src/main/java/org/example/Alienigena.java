package org.example;

public class Alienigena implements Sobrenatural {

    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " (alienígena) surge e faz o ar tremer com uma luz estranha!");
    }
}
