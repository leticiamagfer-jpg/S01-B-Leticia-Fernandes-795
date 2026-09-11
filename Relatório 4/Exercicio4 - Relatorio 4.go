
package main
import "fmt"

func validarIngresso(setor string, codigo int) bool{

	if setor == "VIP" && codigo == 2026 {
		return true
	}

	return false
}

func main(){

	for {
		
		var setor string
		var codigo int

		fmt.Println("Digite o setor do ingresso: ")
		fmt.Scanln(&setor)

		fmt.Println("Digite o codigo do ingresso: ")
		fmt.Scanln(&codigo)

		if validarIngresso(setor, codigo) {
			fmt.Println("Acesso liberado a area VIP!")
			break
		} else {
			fmt.Println("Ingresso ou setor invalido. Tente novamente.")
		}
	}
}