from abc import ABC, abstractmethod

class IUnidadeDeRede(ABC):

    @abstractmethod
    def executar_invasao(self):
        pass

class Cyberdeck:
    
    def __init__(self, modelo: str):
        self.modelo = modelo

class OperadorNetrunner(IUnidadeDeRede):
    
    def __init__(self, nome: str, modelo_cyberdeck: str):
        self.nome = nome
        self.cyberdeck = Cyberdeck(modelo_cyberdeck)

    def executar_invasao(self):
        print(f"<{self.nome}> usa o cyberdeck {self.cyberdeck.modelo} para QUEBRAR O GELO (ICE) de um servidor!")

class DroneDeVigilancia(IUnidadeDeRede):
    
    def __init__(self, codigo: str):
        self.codigo = codigo

    def executar_invasao(self):
        print(f"<Drone {self.codigo}> está INTERCEPTANDO O SINAL da rede!")

class CelulaHacker:
    
    def __init__(self, nome: str, membros: list[IUnidadeDeRede]):
        self.nome = nome
        self.membros = membros

    def iniciar_ataque(self):
        print(f"Célula {self.nome} iniciando ataque contra a corporação!")
        for membro in self.membros:
            membro.executar_invasao()

if __name__ == "__main__":
    
    print("--- Conectando à Rede de Night City ---")

    netrunner = OperadorNetrunner("V", "Arasaka Mk.4")
    drone = DroneDeVigilancia("DR-077")

    celula = CelulaHacker("Voodoo Boys", [netrunner, drone])

    print("\n--- Ataque ---")
    celula.iniciar_ataque()

    # unidade = IUnidadeDeRede()  
    # TypeError: Can't instantiate abstract class IUnidadeDeRede without an implementation for abstract method 'executar_invasao'