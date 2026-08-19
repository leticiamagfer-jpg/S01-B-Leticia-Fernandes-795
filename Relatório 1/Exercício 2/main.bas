Dim pinCorreto As Integer
Dim tentativa As Integer

pinCorreto = 4327

Print "Digite o PIN de acesso:"
Input tentativa

While tentativa <> pinCorreto
    Print "PIN invalido. Tente novamente."
    Input tentativa
Wend 

Print "Transacao autorizada!"

Sleep
