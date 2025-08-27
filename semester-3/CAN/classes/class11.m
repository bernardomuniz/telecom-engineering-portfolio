%Aula 11 - Séries de Taylor e plotagem em gráfico usando Matlab

%Séries de Taylor
x= [-1:0.01:1];
y=cos(x);
S=0;

for n=0:15
    S = S + ((-1)^n * (10).^(2*n+1)/factorial(2*n+1)) - ((-1)^n *(-10).^(2*n+1)/factorial(2*n+1));
end

%Séries de taylor para plotagem de grafico
x = [-5:0.01:5];
y = exp(x);
yy=0;

for n=0:1
    yy = yy + (x.^n)/factorial(n);
end