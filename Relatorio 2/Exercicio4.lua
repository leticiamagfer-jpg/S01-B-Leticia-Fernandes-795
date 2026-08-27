function analisarNumeros(a, b, op)

    if op == "media" then
        calcularMedia(a, b)
    elseif op == "maior" then
        encontrarMaior(a, b)
    elseif op == "diferenca" then
        calcularDifAbsoluta(a, b)
    else
        print("Operacao invalida")
    end
end

function calcularMedia(a, b)
    print((a+b)/2)
end

function encontrarMaior(a, b)
    if a > b then
        print(a)
    else 
        print(b)
    end
end

function calcularDifAbsoluta(a, b)
    print(math.abs(a - b))
end

print("Digite o primeiro numero")
local a = tonumber(io.read())

print("Digite o segundo numero")
local b = tonumber(io.read())

print("Digite a operacao (media, maior, diferenca)")
local op = io.read()

analisarNumeros(a, b, op)