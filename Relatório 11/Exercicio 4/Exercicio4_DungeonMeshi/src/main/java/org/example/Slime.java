package org.example;

public class Slime extends Monstro {

    public Slime(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Cozinhar em fogo baixo até virar uma geleia e servir como sobremesa.";
    }
}
