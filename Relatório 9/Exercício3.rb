class PhoneWave

    def enviar_dmail(mensagem)
      puts "d-mail: #{mensagem}"
      puts "mensagem foi enviada para o passado!"
    end
  end
  
  class MembroDoLab
    attr_reader :numero, :nome
  
    def initialize(numero, nome)
      @numero = numero
      @nome = nome
    end
  end
  
  class LaboratorioDeGadgets
    def initialize
      @phonewave = PhoneWave.new
      @membros = []
    end
  
    def admitir(membro)
      @membros << membro
      puts "membro do lab #{membro.numero}: #{membro.nome}"
    end
  
    def experimento(mensagem)
      @membros.each do |membro|
        puts "membro do lab #{membro.numero}: #{membro.nome}"
      end
      @phonewave.enviar_dmail(mensagem)
    end
  end
  
  eduardo = MembroDoLab.new(1, "lucas")
  carlos = MembroDoLab.new(2, "felipe")
  
  laboratorio = LaboratorioDeGadgets.new
  laboratorio.admitir(lucas)
  laboratorio.admitir(felipe)
  laboratorio.experimento("laboratorio fechado hoje")
  
#composicao: o phonewave pertence ao laboratório e deixa de existir com ele
#agregacao: os membros são adicionados ao laboratório, mas continuam existindo sem ele
