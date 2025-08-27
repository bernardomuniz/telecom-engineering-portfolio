%%Aula 5 - Sistema de equações por matrizes

matriz = [10^-19 1;1 1];
Vet = [1; 2];
[m,n] = size(matriz); %m = linha, n = coluna

for j = 1: n -1
    M = max(abs(matriz(:,j)))
    LP = find(abs(matriz(:,j)) == M);
    auxM = matriz(LP,:);
    auxV = Vet(LP);
    matriz(LP,:) = matriz(j,:);
    Vet(LP) = Vet(j);
    matriz(j,:) = auxM;
    Vet(j) = auxV;
    for i=j+1:m
        a = matriz(i,j)/matriz(j,j);
        matriz(i,:) = matriz(i,:) - a*matriz(j,:);
        Vet(i) = Vet(i) - (a)*Vet(j);
    end
end

for i = 1:m
    Vet(i) = Vet(i)/matriz(i,i)
    matriz(i,:) = matriz(i,:)/matriz(i,i)
end

for i = m - 1:-1:1
    soma = 0;
    for j=i+1:n
        soma = soma+matriz(i,j)*Vet(j);
    end
    Vet(i) = Vet(i) - soma;
end
matriz;
Vet;