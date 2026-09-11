package main

import "fmt"

func ValidarCodigoRastreio(codigo string) (bool, string) {

	if len(codigo) == 10{

		return true, "Codigo de rastreio registrado no sistema!"
	}

	return false, "Erro: O codigo de rastreio deve ter exatamente 10 caracteres."
}

func main(){

	for{
		var codigo string

		fmt.Print("Digite o codigo de rastreio: ")
		fmt.Scanln(&codigo)
		
		valid, msg := ValidarCodigoRastreio(codigo)
		fmt.Println(msg)

		if valid {
			break
		}
	}
}