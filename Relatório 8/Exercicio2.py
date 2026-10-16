class HeroiOverwatch:

    def __init__(self, codinome: str, funcao: str):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"<{self.codinome}> ({self.funcao}) usou sua suprema!")

class HeroiTanque(HeroiOverwatch):
    
    def usar_suprema(self):
        print(f"<{self.codinome}> ({self.funcao}) ergue uma BARREIRA GIGANTE e avança contra o time inimigo!")

class HeroiSuporte(HeroiOverwatch):
    
    def usar_suprema(self):
        print(f"<{self.codinome}> ({self.funcao}) ativa a TRANSCENDÊNCIA e protege os aliados!")

    def curar_equipe(self):
        print(f"<{self.codinome}> está curando a equipe!")

if __name__ == "__main__":
    
    print("--- Partida Iniciada ---")

    reinhardt = HeroiTanque("Reinhardt", "Tanque")
    zenyatta = HeroiSuporte("Zenyatta", "Suporte")

    time: list[HeroiOverwatch] = [reinhardt, zenyatta]

    print("\n--- Supremas ---")
    for heroi in time:
        heroi.usar_suprema()
        if isinstance(heroi, HeroiSuporte):
            heroi.curar_equipe()