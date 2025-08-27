%Aula 8 - Método de Simpson (Integral)
f = @(x) exp(-x.*x);
n=10;
xf=1;
xi=-1;
Dx=(xf-xi)/n;
x=[xi:Dx:xf];

v=ones(1,n+1);
v([2:2:n])=4
v([3:2:n])=2
F=f(x);
A=Dx*sum(v.*F)/3
