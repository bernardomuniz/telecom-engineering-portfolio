%Aula 13 - Mínimos Quadrados

%Mínimos quadrados
x=[1:0.5:5];
y=2*x.^2+1+rand(1,9);

A=[sum(x.*x) sum(x); sum(x) size(x,2)]
B=[sum(x.*y); sum(y)]
solucao=A\B
a=solucao(1)
b=solucao(2)