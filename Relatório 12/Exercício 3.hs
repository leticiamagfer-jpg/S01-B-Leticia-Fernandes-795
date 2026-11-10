data Esboco = Esboco
  { titulo  :: String
  , tecnica :: String
  , horas   :: Int
  }

-- uma equação para cada formato da lista
esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente []    = "O caderno esta vazio."
esbocoMaisRecente (e:_) = titulo e ++ " (" ++ tecnica e ++ ")"

-- caso base -> caderno vazio tem 0 esboços
-- caso recursivo -> 1 (o primeiro) + a contagem do resto
contarEsbocos :: [Esboco] -> Int
contarEsbocos []        = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto

-- soma as horas do primeiro ao total do resto
horasDesenhando :: [Esboco] -> Int
horasDesenhando []     = 0
horasDesenhando (e:resto) = horas e + horasDesenhando resto

main :: IO ()
main = do
  let caderno =
        [ Esboco { titulo = "Ruinas ao Amanhecer", tecnica = "nanquim",  horas = 5 }
        , Esboco { titulo = "Criatura das Neblinas", tecnica = "grafite", horas = 8 }
        , Esboco { titulo = "Floresta Sombria",      tecnica = "carvao",  horas = 3 }
        ]
  let vazio = [] :: [Esboco]

  putStrLn ("Mais recente: " ++ esbocoMaisRecente caderno)
  putStrLn ("Numero de esbocos: " ++ show (contarEsbocos caderno))
  putStrLn ("Total de horas: " ++ show (horasDesenhando caderno))
  putStrLn ("Caderno vazio: " ++ esbocoMaisRecente vazio)

  -- ":" cria uma lista nova, o caderno original continua igual
  let cadernoNovo = Esboco "Castelo Esquecido" "nanquim" 6 : caderno
  putStrLn "--- Caderno novo ---"
  putStrLn ("Mais recente: " ++ esbocoMaisRecente cadernoNovo)
  putStrLn ("Numero de esbocos: " ++ show (contarEsbocos cadernoNovo))
  putStrLn "--- Caderno anterior (inalterado) ---"
  putStrLn ("Mais recente: " ++ esbocoMaisRecente caderno)
  putStrLn ("Numero de esbocos: " ++ show (contarEsbocos caderno))

  -- PASSO 7: descomente para ver o erro em tempo de execução (head de lista vazia).
  -- Depois, volte a comentar.
  -- putStrLn (titulo (head vazio))
