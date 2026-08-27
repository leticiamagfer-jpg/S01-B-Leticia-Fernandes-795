function gerarTabelaPotencias(M, N, b)
    for i = M, N do
        print(b, " ^ ", i, " = ", b ^ i)
    end
end

print("Digite o expoente inicial (M): ")
local M = tonumber(io.read())

print("Digite o expoente final (N): ")
local N = tonumber(io.read())

print("Digite a base: ")
local b = tonumber(io.read())

gerarTabelaPotencias(M, N, b)