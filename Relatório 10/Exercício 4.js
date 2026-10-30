class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    atacar(alvo) {
        console.log(`${this.nome} ataca ${alvo.nome} com um golpe genérico de aura!`);
    }
}

class Intensificador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} reforça o punho com aura e acerta um soco brutal em ${alvo.nome}!`);
    }
}

class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} transforma a aura em eletricidade e descarrega em ${alvo.nome}!`);
    }
}

class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} materializa correntes de aura e prende ${alvo.nome}!`);
    }
}

class Aranha {
    constructor(nome, numero) {
        this.nome = nome;
        this.numero = numero;
    }
}

// Agreg.: as aranhas são criadas fora e só recebidas pela Trupe
class TrupeFantasma {
    #aranhas;

    constructor(cidade, aranhas = []) {
        this.cidade = cidade;
        this.#aranhas = aranhas;
    }

    revelarAranhas() {
        console.log(`--- Aranhas avistadas em ${this.cidade} ---`);
        this.#aranhas.forEach(a => console.log(`Nº ${a.numero} - ${a.nome}`));
    }

    buscarAranha(numero) {
        return this.#aranhas.find(a => a.numero === numero);
    }
}


// main

const chrollo = new Aranha('Chrollo Lucilfer', 4);
const nobunaga = new Aranha('Nobunaga Hazama', 11);

const trupe = new TrupeFantasma('Yorknew', [chrollo, nobunaga]);
trupe.revelarAranhas();

const alvo = trupe.buscarAranha(4);

console.log('\n--- Hunters atacam ---');
const hunters = [
    new Intensificador('Gon'),
    new Transmutador('Killua'),
    new Materializador('Kurapika')
];

// polimorfismo: mesmo atacar(), cada tipo de Nen ataca do seu jeito

hunters.forEach(h => h.atacar(alvo));
