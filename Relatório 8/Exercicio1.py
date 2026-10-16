class MortoVivo:

    def __init__(self, nome: str, almas: int, estus: int):
        self.nome = nome
        self._almas = almas
        self.__estus = estus

    def get_estus(self):
        return self.__estus

    def set_estus(self, quantidade: int):
        if 0 <= quantidade <= 10:
            self.__estus = quantidade
        else:
            print("Quantidade de Estus invalida!")

    def mostrar_status(self):
        return f"Morto-vivo {self.nome} | Almas: {self._almas} | Estus: {self.__estus}"

class Clerigo(MortoVivo):
    
    def __init__(self, nome: str, almas: int, estus: int, milagre: str):
    
        super().__init__(nome, almas, estus)
        self.milagre = milagre

    def mostrar_status(self):
        return f"{super().mostrar_status()} | Milagre: {self.milagre}"

if __name__ == "__main__":
    
    print("--- Acendendo a Fogueira ---")

    petrus = Clerigo("Petrus", 2000, 5, "Cura")

    print("\n--- Status Inicial ---")
    print(petrus.mostrar_status())

    print("\n--- Recarregando Estus ---")
    petrus.set_estus(15)
    petrus.set_estus(10)

    print("\n--- Status Final ---")
    print(petrus.mostrar_status())

    # print(petrus.__estus)  # AttributeError: 'Clerigo' object has no attribute '__estus'