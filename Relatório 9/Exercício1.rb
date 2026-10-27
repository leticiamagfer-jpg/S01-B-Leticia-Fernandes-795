class CoquetelAfterlife

  attr_reader :nome
  
  def initialize(nome, preco)
    @nome = nome
    @_preco = preco
  end

  def preco
    @_preco
  end

  def preco=(valor)
    if valor >= 5 && valor <= 200
      @_preco = valor
    else
      puts "preco invalido!"
    end
  end

  def ficha
    "drink: #{nome}, preco: #{preco}"
  end
end
class DrinkDeLenda < CoquetelAfterlife

  
attr_reader :lenda

def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

  def ficha
    "#{super}, lenda: #{lenda}"
  end
end

drinks = [
  CoquetelAfterlife.new("cosmopolitan", 30),
  DrinkDeLenda.new("cr7", 100, "cr7"),
  DrinkDeLenda.new("serena", 60, "serena")
]

drinks.each do |drink|
  puts drink.ficha
end

drinks[1].preco = 500
drinks[1].preco = 80
puts drinks[1].ficha

#drinks[0].nome = "novo nome"
