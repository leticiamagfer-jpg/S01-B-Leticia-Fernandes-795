use std:: io;

fn imprimir_terminados_em(digito: i32,limite_inferior: i32, limite_superior: i32){
    for i in limite_inferior..=limite_superior{
        if i % 10 == digito{
            println!("{}",i);
        }
    }
}

fn main(){

    let mut entrada_digito = String::new();
    println!("Digite o digito final desejado (0 a 9):");
    io::stdin().read_line(&mut entrada_digito).expect("Erro ao ler");
    let digito: i32 = entrada_digito.trim().parse().unwrap_or(0);


    let mut entrada_limiteIN = String::new();
    println!("Digite o digito final desejado (0 a 9):");
    io::stdin().read_line(&mut entrada_limiteIN).expect("Erro ao ler");
    let limite_inferior: i32 = entrada_limiteIN.trim().parse().unwrap_or(0);

    let mut entrada_limiteS = String::new();
    println!("Digite o digito final desejado (0 a 9):");
    io::stdin().read_line(&mut entrada_limiteS).expect("Erro ao ler");
    let limite_superior: i32 = entrada_limiteS.trim().parse().unwrap_or(0);

    imprimir_terminados_em(digito,limite_inferior,limite_superior);


}