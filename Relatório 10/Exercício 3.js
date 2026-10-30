class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `Criatura: ${this.criatura} | Nível de perigo: ${this.nivelDePerigo}`;
    }
}

class DiarioMisterioso {
    #fichas;

    constructor(numero) {
        this.numero = numero;
        this.#fichas = [];
    }

    anotar(criatura, nivelDePerigo) {

        // comp.: a ficha é criada dentro do método do diário
        
        const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(ficha);
    }

    exibirFichas() {
        console.log(`--- Diário número ${this.numero} ---`);
        this.#fichas.forEach(f => console.log(f.descrever()));
    }
}

class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}

class CabanaDoMisterio {
    #funcionarios;

    constructor(dono) {
        this.dono = dono;
        this.#funcionarios = [];
    }

    // agreg.: o funcionário já vem pronto, criado fora da Cabana
    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`\n--- A Cabana do Mistério de ${this.dono} abriu as portas! ---`);
        this.#funcionarios.forEach(f => console.log(`${f.nome} - ${f.cargo}`));
    }
}


// main

const diario = new DiarioMisterioso(3);
diario.anotar('Gnomos', 3);
diario.anotar('Multi-Urso', 5);
diario.anotar('Gobbleweewer', 4);
diario.exibirFichas();

// os funcionários existem antes da cabana

const soos  = new Funcionario('Soos', 'Faz-tudo');
const wendy = new Funcionario('Wendy', 'Caixa');

const cabana = new CabanaDoMisterio('Stan');
cabana.contratar(soos);
cabana.contratar(wendy);
cabana.abrirAsPortas();

// EXPLICAÇÃO:

// Composição: as FichaDeCriatura são criadas (new) dentro do método anotar()
// do DiarioMisterioso e ficam guardadas no #fichas privado. Elas só existem
// dentro do diário: se o diário deixar de existir, as fichas somem junto.
//
// Agregação ("agreg."): os funcionários (soos e wendy) são criados fora da Cabana, no
// programa principal, e só depois entregues a ela por contratar(). A cabana
// guarda apenas uma referência a eles, então os funcionários continuam
// existindo mesmo que a Cabana deixe de existir.
