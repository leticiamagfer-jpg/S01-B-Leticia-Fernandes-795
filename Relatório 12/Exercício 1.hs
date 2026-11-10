--- nome, preço e intensidade (1 a 10)
data Cafe = Cafe String Double Int

-- pattern matching no parâmetro separa os campos; show converte o preço
descrever :: Cafe -> String
descrever (Cafe nome preco _) = nome ++ " - R$ " ++ show preco

-- guards: testados de cima para baixo
forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"   -- só chega aqui se for menor que 8
  | otherwise        = "Suave"

-- if é uma expressão: o else é obrigatório
precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido leite (Cafe _ preco _) =
  if leite
    then preco + 2.0
    else preco

main :: IO ()
main = do
  let cafeForte      = Cafe "Espresso Curto" 8.5 9
  let cafeEquilibrado = Cafe "Cafe da Casa" 7.0 6
  let cafeSuave      = Cafe "Cafe Leve" 6.0 3
  let cafes = [cafeForte, cafeEquilibrado, cafeSuave]

  putStrLn "--- Cafes do dia ---"
  mapM_ (\c -> putStrLn (descrever c ++ " | Forca: " ++ forca c)) cafes

  putStrLn "--- Preco do Cafe da Casa ---"
  print (precoDoPedido True cafeEquilibrado)   -- com leite
  print (precoDoPedido False cafeEquilibrado)  -- sem leite
