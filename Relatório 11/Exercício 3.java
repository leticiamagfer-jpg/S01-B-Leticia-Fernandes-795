import java.util.HashMap;


// Interface Sobrenatural -> contrato: só assinatura, sem implementação

interface Sobrenatural {
    void manifestar();
}


// Clas. Alienigena

class Alienigena implements Sobrenatural {

    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " (alienígena) surge e faz o ar tremer com uma luz estranha!");
    }
}


// Classe EspiritoYoukai

class EspiritoYoukai implements Sobrenatural {

    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " (espírito) aparece como uma névoa fria e sussurra nas sombras...");
    }
}


// Clas. MapaDeAvistamentos

class MapaDeAvistamentos {

    // Chave: nome do local (único). Valor: qualquer ser que implemente Sobrenatural

    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        this.avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        avistamentos.put(local, ser);
    }

    public void investigar(String local) {
        Sobrenatural ser = avistamentos.get(local); // get devolve null se a chave não existir

        if (ser == null) {
            System.out.println("O local \"" + local + "\" está tranquilo. Nada foi avistado.");
        } else {
            System.out.println("Investigando \"" + local + "\"...");
            ser.manifestar();
        }
    }
}


// Classe principal

public class Exercicio3 {

    public static void main(String[] args) {

        Alienigena alien = new Alienigena("Serpo");
        EspiritoYoukai espirito = new EspiritoYoukai("Turbo Vovó");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();
        mapa.registrar("Túnel abandonado", espirito);
        mapa.registrar("Campo de milho", alien);

        mapa.investigar("Túnel abandonado");
        mapa.investigar("Campo de milho");
        mapa.investigar("Praça central"); // não registrado -> local tranquilo
    }
}
