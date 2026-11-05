
// Clas. abstrata Morador
abstract class Morador {

    // Encapsulamento: atributo privado, acesso apenas via getter.
    private String nome;

    public Morador(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    // Método abstrato: sem corpo. Toda classe filha concreta é OBRIGADA a implementá-lo.
    public abstract void apresentar();
}


// Clas. Mago

class Mago extends Morador {

    private String feitico;

    public Mago(String nome, String feitico) {
        super(nome); // repassa o nome para o construtor da superclasse
        this.feitico = feitico;
    }

    @Override
    public void apresentar() {
        System.out.println("Sou o mago " + getNome() + " e meu feitiço é: " + feitico + ".");
    }
}


// Clas. DemonioDoFogo

class DemonioDoFogo extends Morador {

    public DemonioDoFogo(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println("Sou " + getNome() + ", o demônio do fogo, e é a minha chama que faz o castelo andar!");
    }
}


//  Clas. principal

public class Exercicio1 {

    public static void main(String[] args) {

        // Polimorfismo: variáveis do tipo da superclasse (Morador)
        // guardando objetos das subclasses.
        Morador m1 = new Mago("Howl", "transformação em pássaro");
        Morador m2 = new DemonioDoFogo("Calcifer");

        // Ligação dinâmica: em tempo de execução a JVM chama a versão
        // de apresentar() correspondente ao objeto real.
        m1.apresentar();
        m2.apresentar();

        // Item 5: tentativa de instanciar uma classe abstrata.
        // Descomentando a linha abaixo, o compilador acusa algo como:
        //   "Morador is abstract; cannot be instantiated"
        // O erro ocorre em tempo de COMPILAÇÃO, o programa nem chega a rodar.
        // Morador generico = new Morador("Fulano");
    }
}
