import java.util.ArrayList;


// Clas. abstrata monstro

abstract class Monstro {

    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    // Cada tipo de monstro tem a sua própria receita.
    public abstract String receita();
}


// Subclasses concretas

class Slime extends Monstro {

    public Slime(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Cozinhar em fogo baixo até virar uma geleia e servir como sobremesa.";
    }
}

class Mandragora extends Monstro {

    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Fritar em tempura, bem crocante, depois de arrancar da terra.";
    }
}


// Clas. Panela (parte da composição)

class Panela {

    private String material;

    public Panela(String material) {
        this.material = material;
    }

    public String getMaterial() {
        return material;
    }
}


// Clas. Cozinheiro

class Cozinheiro {

    private String nome;
    private Panela panela;                      // compos.: criada aqui dentro
    private ArrayList<Monstro> ingredientes;    // agreg.: objetos criados fora

    public Cozinheiro(String nome, String materialDaPanela) {
        this.nome = nome;
        this.panela = new Panela(materialDaPanela); // o cozinheiro cria a própria panela
        this.ingredientes = new ArrayList<>();
    }

    // Recebe um monstro que já existia; o cozinheiro só guarda a referência
    public void adicionarIngrediente(Monstro monstro) {
        ingredientes.add(monstro);
    }

    public void servirBanquete() {
        System.out.println("Cozinheiro: " + nome);
        System.out.println("Panela de " + panela.getMaterial());
        System.out.println("--- Banquete ---");
        for (Monstro m : ingredientes) {
            System.out.println(m.getNome() + ": " + m.receita());
        }
    }
}


// Clas. principal

public class Exercicio4 {

    /*
     * 6. COMPOSIÇÃO x AGREGAÇÃO NESTE PROGRAMA
     *
     * COMPOSIÇÃO (Cozinheiro -> Panela):
     *   O Cozinheiro cria a Panela dentro do seu próprio construtor
     *   (new Panela(materialDaPanela)). A panela nasce com ele, pertence só a ele
     *   e não existe fora dele: não é criada nem passada pela main. Se o cozinheiro
     *   deixa de existir, a panela vai junto. É uma dependência total (ciclo de
     *   vida atrelado).
     *
     * AGREGAÇÃO (Cozinheiro -> Monstro):
     *   Os monstros (Slime e Mandragora) são criados na main, ANTES do cozinheiro,
     *   e só depois entregues por adicionarIngrediente(). O cozinheiro guarda apenas
     *   a referência. Os monstros existem independentemente dele e poderiam ser
     *   usados por outro cozinheiro. É uma ligação fraca.
     */
    public static void main(String[] args) {

        // Criados antes do cozinheiro (independentes dele)
        
        Monstro slime = new Slime("Slime verde");
        Monstro mandragora = new Mandragora("Mandrágora");

        // A panela é criada dentro do Cozinheiro (só passamos o material)

        Cozinheiro senshi = new Cozinheiro("Senshi", "ferro fundido");

        senshi.adicionarIngrediente(slime);
        senshi.adicionarIngrediente(mandragora);

        senshi.servirBanquete();
    }
}
