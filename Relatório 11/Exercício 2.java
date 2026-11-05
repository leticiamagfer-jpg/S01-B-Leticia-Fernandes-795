import java.util.ArrayList;


// Clas. ItemDoCardapio

class ItemDoCardapio {

    private String nome;
    private double preco;

    public ItemDoCardapio(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    // Item comum: o preço final é o próprio preço cadastrado
    public double precoFinal() {
        return preco;
    }
}


// clas. ComboLeblanc

class ComboLeblanc extends ItemDoCardapio {

    public ComboLeblanc(String nome, double preco) {
        super(nome, preco);
    }

    // Sobrescrita: combo tem 10% de desconto
    // Usa-se getPreco() porque "preco" é private na superclasse
    @Override
    public double precoFinal() {
        return getPreco() * 0.9;
    }
}


// Class. CafeLeblanc

class CafeLeblanc {

    private ArrayList<ItemDoCardapio> cardapio;

    // Construtor sem parâmetros: cria o cardápio vazio.
    public CafeLeblanc() {
        this.cardapio = new ArrayList<>();
    }

    // Recebe um item já criado (ComboLeblanc também serve, pois é um ItemDoCardapio).
    public void adicionar(ItemDoCardapio item) {
        cardapio.add(item);
    }

    public void mostrarCardapio() {
        System.out.println("===== Cardápio do Leblanc =====");
        for (ItemDoCardapio item : cardapio) {

            // precoFinal() é resolvido dinamicamente: item comum ou combo,
            // cada um calcula o preço do seu jeito (polimorfismo).
            
            System.out.printf("%-25s R$ %.2f%n", item.getNome(), item.precoFinal());
        }
    }
}


// Clas. principal

public class Exercicio2 {

    public static void main(String[] args) {

        ItemDoCardapio cafe  = new ItemDoCardapio("Café coado", 12.00);
        ItemDoCardapio curry = new ItemDoCardapio("Curry da casa", 30.00);
        ItemDoCardapio combo = new ComboLeblanc("Combo Curry + Café", 40.00); // 40 * 0.9 = 36.00

        CafeLeblanc leblanc = new CafeLeblanc();
        leblanc.adicionar(cafe);
        leblanc.adicionar(curry);
        leblanc.adicionar(combo);

        leblanc.mostrarCardapio();
    }
}
