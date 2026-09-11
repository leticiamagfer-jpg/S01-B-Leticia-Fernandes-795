package main

import "fmt"

func main(){

	var quantidade int

	fmt.Println("Digite a quantidade de plantoes: ")
	fmt.Scanln(&quantidade)

	for i := 1; i <= quantidade; i++ {

		dia := 1 + (i-1)*4
		fmt.Printf("Plantao %d: Dia %d do mes\n", i, dia)

	}
}