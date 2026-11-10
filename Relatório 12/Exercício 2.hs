-- peso máximo que a vassoura aguenta
pesoMaximo :: Double
pesoMaximo = 15.0

-- PASSO 7: descomente a linha abaixo para ver o erro de compilação
-- (definição duplicada: Multiple declarations of 'pesoMaximo').
-- Depois, volte a comentá-la para o programa rodar.
-- pesoMaximo = 20.0

data Encomenda = Encomenda
  { destinatario :: String
  , peso         :: Double
  , frete        :: Double
  }

-- lê os campos com as funções de campo
descrever :: Encomenda -> String
descrever e =
  destinatario e ++ " | " ++ show (peso e) ++ " kg | frete R$ " ++ show (frete e)

-- filter com lambda -> mantém só o que a vassoura aguenta
cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas = filter (\e -> peso e <= pesoMaximo) encomendas

-- map extrai os fretes e sum soma
totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)

main :: IO ()
main = do
  let encomendas =
        [ Encomenda { destinatario = "Padaria da Osono", peso = 3.5,  frete = 12.0 }
        , Encomenda { destinatario = "Tombo",            peso = 20.0, frete = 30.0 }
        , Encomenda { destinatario = "Madame",           peso = 8.0,  frete = 18.5 }
        , Encomenda { destinatario = "Ursula",           peso = 15.0, frete = 15.0 }
        , Encomenda { destinatario = "Prefeitura",       peso = 40.0, frete = 55.0 }
        ]
  let leves = cabemNaVassoura encomendas

  putStrLn "Todas as encomendas"
  mapM_ putStrLn (map descrever encomendas)
  putStrLn "Cabem na vassoura"
  mapM_ putStrLn (map descrever leves)
  putStrLn ("Total de fretes (que cabem): R$ " ++ show (totalDeFretes leves))
