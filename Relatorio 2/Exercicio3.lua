function filtrarMaiores(t1, K)

    local t2 = {}
    for k = 1, #t1 do
        if t1[k] > K then
            table.insert(t2, t1[k])
        end
    end
    return t2
end

print("Digite a quantidade de elementos (N)")

local N = tonumber(io.read())
local t1 = {}

for i = 1, N do
    print("Digite o elemento ", i)
    local aux = tonumber(io.read())
    table.insert(t1, aux)
end    

print("Digite o limite (K)")

local K = tonumber(io.read())
local t2 = filtrarMaiores(t1, K)

print("Elementos maiores que ", K)

for j = 1, #t2 do
    print(t2[j])
end