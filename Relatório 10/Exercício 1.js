class Pokemon {


    // encapsulamento: vida privada, só pode ser reduzida por sofrerDano()
    #vida;

    constructor(apelido, tipo, vidaInicial) {
        this.apelido = apelido;
        this.tipo = tipo;
        this.#vida = vidaInicial;
    }

    // getter sem setter: de fora, a vida só pode ser lida
    get vida() {
        return this.#vida;
    }

    sofrerDano(pontos) {
        this.#vida -= pontos;
        if (this.#vida < 0) {
            this.#vida = 0;
        }
        console.log(`${this.apelido} sofreu ${pontos} de dano. Vida restante: ${this.#vida}`);
    }

    atacar(alvo) {
        console.log(`${this.apelido} usa um ataque genérico em ${alvo.apelido}!`);
        alvo.sofrerDano(10);
    }
}

// herança : Squirtle é um Pokemon, com tipo fixo 'Água'
class Squirtle extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Água', vidaInicial);
    }

    // sobrescritaa
    atacar(alvo) {
        console.log(`${this.apelido} lança um JATO DE ÁGUA em ${alvo.apelido}!`);
        alvo.sofrerDano(20);
    }
}

// HERANÇA: Bulbasaur É UM Pokemon, com tipo fixo 'Planta'
class Bulbasaur extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Planta', vidaInicial);
    }

    // sobrescrita
    atacar(alvo) {
        console.log(`${this.apelido} dispara o CHICOTE DE VINHA em ${alvo.apelido}!`);
        alvo.sofrerDano(15);
    }
}


// main

const squirtle = new Squirtle('Tartaruguinha', 50);
const bulbasaur = new Bulbasaur('Folhinha', 30);

console.log('--- Início do duelo ---');
bulbasaur.atacar(squirtle);   // 1 ataque do Bulbasaur
squirtle.atacar(bulbasaur);   // 1º ataque do Squirtle
squirtle.atacar(bulbasaur);   // 2º ataque do Squirtle (vida não fica negativa)

console.log('\n--- Vida final (via getter) ---');
console.log(`${squirtle.apelido}: ${squirtle.vida}`);
console.log(`${bulbasaur.apelido}: ${bulbasaur.vida}`);

// Passo 5: acessar #vida diretamente gera SyntaxError e o programa nem roda.
// console.log(squirtle.#vida);
