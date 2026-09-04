use std::io;

fn calcular_pontuacao(prova1: f64, prova2: f64, redacao: f64) -> f64 {
    let media = (((prova1 + prova2) / 2.0) * 0.6) + (0.4 * redacao);
    if media >= 60.0 {
        println!("Parabens! Candidato aprovado no processo seletivo.\nPontuacao final: {}", media);
    } else {
        println!("Infelizmente o candidato nao atingiu a pontuacao minima de aprovacao.\nPontuacao final: {}", media);
    }
    media
}

fn main() {
    let mut entrada = String::new();
    println!("Digite a nota da Prova 1:");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler");
    let prova1: f64 = entrada.trim().parse().unwrap_or(0.0);

    let mut entrada2 = String::new();
    println!("Digite a nota da Prova 2:");
    io::stdin().read_line(&mut entrada2).expect("Erro ao ler");
    let prova2: f64 = entrada2.trim().parse().unwrap_or(0.0);

    let mut entrada3 = String::new();
    println!("Digite a nota da redacao:");
    io::stdin().read_line(&mut entrada3).expect("Erro ao ler");
    let redacao: f64 = entrada3.trim().parse().unwrap_or(0.0);

    calcular_pontuacao(prova1, prova2, redacao);
    
}