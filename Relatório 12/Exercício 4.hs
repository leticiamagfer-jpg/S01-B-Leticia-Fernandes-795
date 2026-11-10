data Etapa = NaFila | NoBanho | Concluido
  deriving (Show, Eq)

data Atendimento = Atendimento
  { cliente :: String
  , servico :: String
  , valor   :: Double
  , etapa   :: Etapa
  }

descrever :: Atendimento -> String
descrever a =
  cliente a ++ " | " ++ servico a ++ " | " ++ show (etapa a)

-- cria um atendimento NOVO; o original não muda
concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

-- só os concluídos já foram pagos
arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
  sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))

main :: IO ()
main = do
  let a1 = Atendimento { cliente = "Deus do Rio", servico = "Banho de ervas", valor = 120.0, etapa = NaFila }
  let a2 = Atendimento { cliente = "Sem-Rosto",   servico = "Banho simples",  valor = 60.0,  etapa = NoBanho }
  let a3 = Atendimento { cliente = "Deus Rabanete", servico = "Banho completo", valor = 200.0, etapa = NaFila }
  let original = [a1, a2, a3]
  -- alguns passam por concluir
  let atualizada = [concluir a1, a2, concluir a3]

  putStrLn "--- Lista original ---"
  mapM_ putStrLn (map descrever original)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado original))

  putStrLn "--- Lista atualizada ---"
  mapM_ putStrLn (map descrever atualizada)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado atualizada))
