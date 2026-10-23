class Instrumentista
  
    attr_reader :nome, :instrumento
    def initialize(nome, instrumento)
      @nome = nome
      @instrumento = instrumento
    end
  
    def interpretar(peca)
      raise NotImplementedError, "#{self.class} implementa interpretar"
    end
  end

  class Solista < Instrumentista
    def interpretar(peca)
      puts "#{nome} toca #{instrumento}, da banda #{peca} e conduz a melodia principal."
    end
  end

  class Acompanhador < Instrumentista
    def interpretar(peca)
      puts "#{nome} toca #{instrumento}, da banda #{peca} e acompanha o ritmo do solista."
    end
  end

  class Regente
    attr_reader :nome
    def initialize(nome)
      @nome = nome
      @orquestra = []
    end

    def convocar(instrumentista)
      @orquestra << instrumentista
    end

    def reger(peca)
      puts "#{nome} rege #{peca}"
      @orquestra.each do |instrumentista|
        instrumentista.interpretar(peca)
      end
    end

    def escalacao
      @orquestra.map do |instrumentista|
        "#{instrumentista.class}: #{instrumentista.nome}"
      end
    end
  end
  
  solista = Solista.new("herbert vianna", "guitarra")
  acompanhador = Acompanhador.new("vital dias", "bateria")
  regente = Regente.new("herbert vianna")
  
  regente.convocar(solista)
  regente.convocar(acompanhador)
  regente.reger("os paralamas do sucesso")
  
  regente.escalacao.each do |texto|
    puts texto
  end
  

#instrumentista = Instrumentista.new("fulano", "flauta")
#instrumentista.interpretar("paralamas do sucesso")
