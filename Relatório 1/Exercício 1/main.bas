Dim peso As Integer
Dim ml As Integer
Dim meta As Integer

Print "Digite seu peso em kg:"
Input peso
Print "Digite quantos mililitros de agua ingeriu no dia:"
Input ml

meta = 35*peso

if ml >= meta Then
    Print "Meta atingida!"
else 
    Print "Meta nao atingida"
end if
Sleep
