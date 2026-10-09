using System;
using System.Collections.Generic;

// todo: CLASSE BASE
public class EntidadeCosmica
{
    public string Nome { get; private set; }
    public string Origem { get; set; } = "Desconhecida";

    public EntidadeCosmica(string nome)
    {
        this.Nome = nome;
    }

    // todo: VIRTUAL
    // mostra o nome e só mostra a origem quando ela é conhecida
    public virtual void Manifestar()
    {
        Console.WriteLine($"Entidade: {Nome}");

        if (Origem != "Desconhecida")
        {
            Console.WriteLine($"Origem: {Origem}");
        }
    }
}

// todo: HERANÇA
public class Profundo : EntidadeCosmica
{
    public Profundo(string nome) : base(nome)
    {
    }

    // todo: OVERRIDE
    // sobrescreve o método sem chamar a versão da classe mãe
    public override void Manifestar()
    {
        Console.WriteLine($"{Nome} emergiu das profundezas!");
    }
}

public class MiGo : EntidadeCosmica
{
    public MiGo(string nome) : base(nome)
    {
    }

    // todo: BASE
    // executa primeiro o método da classe mãe
    public override void Manifestar()
    {
        base.Manifestar();
        Console.WriteLine($"{Nome} emitiu sons estranhos!");
    }
}

public class Pesquisador
{
    public string Nome { get; private set; }

    // todo: LISTA
    // guarda entidades de diferentes classes derivadas de EntidadeCosmica
    private List<EntidadeCosmica> _catalogo;

    public Pesquisador(string nome)
    {
        this.Nome = nome;
        this._catalogo = new List<EntidadeCosmica>();
    }

    public void Catalogar(EntidadeCosmica e)
    {
        this._catalogo.Add(e);
    }

    public void LerCatalogo()
    {
        Console.WriteLine($"\nPesquisador: {Nome}");
        Console.WriteLine("=== Catálogo de entidades ===");

        // todo: POLIMORFISMO
        // cada entidade executa sua própria versão de Manifestar()
        foreach (var entidade in _catalogo)
        {
            entidade.Manifestar();
            Console.WriteLine("--------------------");
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Biblioteca da Universidade Miskatonic ===");

        EntidadeCosmica cthulhu = new EntidadeCosmica("Cthulhu");
        Profundo dagon = new Profundo("Dagon");
        MiGo migo = new MiGo("Mi-Go");

        cthulhu.Origem = "R'lyeh";
        migo.Origem = "Yuggoth";

        Pesquisador pesquisador = new Pesquisador("Henry Armitage");

        pesquisador.Catalogar(cthulhu);
        pesquisador.Catalogar(dagon);
        pesquisador.Catalogar(migo);

        pesquisador.LerCatalogo();
    }
}
