class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}

// Classe base: contrato (usarHabilidade) + composição (Pistola)
class AgenteProtocolo {
    #pistola;

    constructor(codinome, modeloDaPistola) {
        this.codinome = codinome;
        // COMPOSIÇÃO: a Pistola é criada DENTRO do constructor
        this.#pistola = new Pistola(modeloDaPistola);
    }

    // cobtrato: as filhas devem sobrescrever
    usarHabilidade() {
        throw new Error(`O agente ${this.codinome} deve implementar o método 'usarHabilidade()'`);
    }

    entrarEmCombate() {
        console.log(`${this.codinome} entra em combate com a pistola ${this.#pistola.modelo}: ${this.usarHabilidade()}`);
    }
}

class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return 'solta uma cortina de fumaça e bloqueia a visão dos inimigos!';
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return 'lança um drone que revela a posição dos inimigos!';
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return 'dá um dash para frente e abre o confronto!';
    }
}

// agreg.: os agentes são criados fora e só recebidos pelo esquadrão
class Esquadrao {
    #agentes;

    constructor(nome, agentes) {
        this.nome = nome;
        this.#agentes = agentes;
    }

    iniciarPartida() {
        console.log(`\n--- Esquadrão ${this.nome} inicia a partida! ---`);
        // POLIMORFISMO: mesma chamada, cada agente usa a sua habilidade
        this.#agentes.forEach(a => a.entrarEmCombate());
    }

    listarControladores() {
        return this.#agentes.filter(a => a instanceof Controlador);
    }
}


// main

const brimstone = new Controlador('Brimstone', 'Sheriff');
const omen      = new Controlador('Omen', 'Ghost');
const sova      = new Iniciador('Sova', 'Classic');
const jett      = new Duelista('Jett', 'Frenzy');

const esquadrao = new Esquadrao('Alfa', [brimstone, omen, sova, jett]);
esquadrao.iniciarPartida();

console.log('\nControladores do esquadrão:');
esquadrao.listarControladores().forEach(c => console.log(`- ${c.codinome}`));

// 8: o objeto é criado normalmente, mas a chamada gera Error

const generico = new AgenteProtocolo('Desconhecido', 'Classic');

// generico.entrarEmCombate();
