package org.example;

public class Mandragora extends Monstro {

    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Fritar em tempura, bem crocante.";
    }
}
