use std::io;

fn validar_placa(placa:&str) -> bool{
    if placa.len() < 7 {
        return false;
    }
    let mut MA = 0;
    let mut NUM = 0;

    for verificacao in placa.chars(){
        if verificacao.is_ascii_uppercase(){
            MA += 1;
        }
        if verificacao.is_numeric(){
            NUM += 1;
        }
    }

    if MA >= 4 && NUM >= 2{
        return true;
    }else{
        return false;
    }

}

fn main(){

    loop{
        let mut entrada = String::new();
        println!("Digite a placa do veiculo:");
        io::stdin().read_line(&mut entrada).expect("Erro ao ler");

        let placa = entrada.trim();

        if validar_placa(placa) {
            println!("Placa cadastrada no sistema!");
            break;
        } else {
            println!("Placa invalida, tente novamente.");
        }
    }

}

