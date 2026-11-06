package org.example;

public class EspiritoYoukai implements Sobrenatural {

    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " (espírito) aparece como uma névoa fria e sussurra nas sombras...");
    }
}
