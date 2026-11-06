package org.example;

public class Main {

    /*
     * COMPOSIÇÃO: a Panela é criada dentro do construtor do Cozinheiro. Ela nasce
     * com ele, pertence só a ele e deixa de existir junto com ele (dependência total).
     *
     * AGREGAÇÃO: o Slime e a Mandragora são criados aqui na main, antes do
     * Cozinheiro, e só depois entregues a ele. Ele guarda apenas a referência, então
     * os monstros existem independentemente do cozinheiro (ligação fraca).
     */
    public static void main(String[] args) {

        Slime slime = new Slime("Slime verde");
        Mandragora mandragora = new Mandragora("Mandrágora");

        Cozinheiro senshi = new Cozinheiro("Senshi", "ferro fundido");

        senshi.adicionarIngrediente(slime);
        senshi.adicionarIngrediente(mandragora);

        senshi.servirBanquete();
    }
}
