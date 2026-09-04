use std::io;

fn acertou_o_alvo(palpite: i32, numero_secreto: i32) -> bool{
    if (palpite - numero_secreto).abs() <= 5{
        return true;
    }else{
        return false;
    }
}

fn main(){

    let numero_secreto: i32 = 42;
    loop {
        let mut entrada = String::new();
        io::stdin().read_line(&mut entrada).expect("Erro ao ler");
        let palpite: i32 = entrada.trim().parse().expect("Digite seu palpite");
        
        if acertou_o_alvo(palpite,numero_secreto) == true {
            println!("Parabens, voce acertou o alvo!");
            if(palpite != numero_secreto){
                let distancia = (palpite - numero_secreto).abs();
                println!("Voce ficou apenas {} unidade(s) do numero secreto ({})",distancia,numero_secreto);
            }
            break;
        }else{
            println!("Voce passou longe! Tente novamente.");
        }
    }



}
