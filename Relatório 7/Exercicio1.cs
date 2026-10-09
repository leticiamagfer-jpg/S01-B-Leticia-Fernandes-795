using System;

public class CombatenteDeGondor
{

    public string Nome { get; private set; }
    public string Povo { get; private set; }
    public string Posto { get; private set; }

    public string Armamento { get; private set; } = "Desarmado";

    public CombatenteDeGondor(string nome, string povo, string posto)
    {
        this.Nome = nome;
        this.Povo = povo;
        this.Posto = posto;
        Console.WriteLine($"[Combatente] {Nome} foi criado.");
    }

    public void Equipar(string arma)
    {
        this.Armamento = arma;
    }

    public void ApresentarUnidade()
    {
        Console.WriteLine($"\n--- {Nome} ---");
        Console.WriteLine($"Povo: {Povo}");
        Console.WriteLine($"Posto: {Posto}");

        if (Armamento != "Desarmado")
        {
            Console.WriteLine($"Armamento: {Armamento}");
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Cerco a Minas Tirith ===");

        CombatenteDeGondor aragorn =
            new CombatenteDeGondor("Aragorn", "Homem", "Capitão");

        CombatenteDeGondor legolas =
            new CombatenteDeGondor("Legolas", "Elfo", "Arqueiro");

        CombatenteDeGondor gimli =
            new CombatenteDeGondor("Gimli", "Anão", "Guerreiro");

        aragorn.Equipar("Espada");
        legolas.Equipar("Arco");

        aragorn.ApresentarUnidade();
        legolas.ApresentarUnidade();
        gimli.ApresentarUnidade();
    }
}
