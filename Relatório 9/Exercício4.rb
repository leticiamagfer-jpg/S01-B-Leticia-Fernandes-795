module Depoente

    def depor
      raise NotImplementedError, "#{self.class} implementa depor"
    end
  end
  
  module Detivel

    def ser_detido
      puts "#{nome} foram presos"
    end
  end
  
  class Envolvido

    attr_reader :nome
    def initialize(nome)
      @nome = nome
    end
  end
  
  class TestemunhaOcular < Envolvido
    
    include Depoente
  
    def depor
      puts "#{nome}: eles são culpados"
    end
  end
  
  class SuspeitoDoCrime < Envolvido
    
    include Depoente
    include Detivel
  
    def depor
      puts "#{nome}: eu vi tudo"
    end
  end
  
  class Investigacao
    
    def initialize(caso)
      @caso = caso
      @envolvidos = []
    end
  
    def registrar(envolvido)
      @envolvidos << envolvido
    end
  
    def ouvir_todos
      puts "caso: #{@caso}"
      @envolvidos.each do |envolvido|
        envolvido.depor
      end
    end
  
    def acionar_scotland_yard
      detiveis = @envolvidos.select { |envolvido| envolvido.respond_to?(:ser_detido) }
      detiveis.each do |envolvido|
        envolvido.ser_detido
      end
    end
  end
  
  testemunha = TestemunhaOcular.new("dafne")
  suspeito1 = SuspeitoDoCrime.new("dr. julianp")
  suspeito2 = SuspeitoDoCrime.new("joao")
  
  investigacao = Investigacao.new("caso 1")
  investigacao.registrar(testemunha)
  investigacao.registrar(suspeito1)
  investigacao.registrar(suspeito2)
  
  investigacao.ouvir_todos
  investigacao.acionar_scotland_yard
