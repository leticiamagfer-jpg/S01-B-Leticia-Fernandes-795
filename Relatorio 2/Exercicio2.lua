function contarOcorrencias(tab, X)

    local c = 0
    for k = 1, #tab do
        if X == tab[k] then
            c = c + 1
        end
    end
    return c
end

print("Digite a quantidade de elementos")

local N = tonumber(io.read())
local aux
local tab = {}

for i = 1, N do
    print("Digite o elemento ", i,":" )
    aux = tonumber(io.read())
    table.insert(tab, aux)
end

print("Digite o numero X a ser buscado: ")

local X = tonumber(io.read())
local c = contarOcorrencias(tab, X)

print("O numero ", X, "aparece ", c, "vez(es) na tabela.")