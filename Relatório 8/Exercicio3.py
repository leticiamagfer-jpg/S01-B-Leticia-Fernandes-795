class Persona:

    def __init__(self, nome: str, arcano: str):
        self.nome = nome
        self.arcano = arcano

    def invocar(self):
        print(f"Persona! <{self.nome}> (Arcano: {self.arcano})")

class Aliado:
    
    def __init__(self, nome: str, codinome: str):
        self.nome = nome
        self.codinome = codinome

class Lider:
    
    def __init__(self, codinome: str):
        self.codinome = codinome
        self.persona = Persona("Arsène", "Louco")
        self._equipe = []

    def recrutar(self, aliado: Aliado):
        self._equipe.append(aliado)
        print(f"-> {aliado.nome} ({aliado.codinome}) entrou para os Phantom Thieves.")

    def infiltrar(self, palacio: str):
        print(f"<{self.codinome}> invadiu o Palácio de {palacio}!")
        self.persona.invocar()
        print("Equipe na infiltração:")
        for aliado in self._equipe:
            print(f"  {aliado.codinome} ({aliado.nome})")

# Composição -> a Persona é criada dentro do "__init__" do Lider e só existe enquanto ele existir
# Agregação -> os Aliados são criados fora do Lider e apenas adicionados à _equipe, então já existiam antes do recrutamento e continuam existindo sem ele

if __name__ == "__main__":
    
    print("--- Reunindo os Phantom Thieves ---")

    ryuji = Aliado("Ryuji Sakamoto", "Skull")
    ann = Aliado("Ann Takamaki", "Panther")

    joker = Lider("Joker")

    print("\n--- Recrutamento ---")
    joker.recrutar(ryuji)
    joker.recrutar(ann)

    print("\n--- Infiltração ---")
    joker.infiltrar("Kamoshida")