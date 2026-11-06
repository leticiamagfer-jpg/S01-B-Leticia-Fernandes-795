package org.example;

import java.util.ArrayList;

public class CafeLeblanc {

    private ArrayList<ItemDoCardapio> cardapio;

    public CafeLeblanc() {
        this.cardapio = new ArrayList<>();
    }

    public void adicionar(ItemDoCardapio item) {
        cardapio.add(item);
    }

    public void mostrarCardapio() {
        System.out.println("===== Cardápio do Leblanc =====");
        for (ItemDoCardapio item : cardapio) {
            System.out.printf("%-25s R$ %.2f%n", item.getNome(), item.precoFinal());
        }
    }
}
