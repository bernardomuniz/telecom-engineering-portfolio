%%Aula 6 - Sistema de equações por matrizes | Método de Jacbo Richardson

A = [ 10 1 -1; 2 10 8; 7 1 10];
b = [10;20;30];

[m,n] = size(A);

for i = 1: m
    b(i,:) = b(i,:)/A(i,i);
    A(i,:) = A(i,:)/A(i,i);
    A(i,i) = 0;
end

x1=b;
x2=-A*x1+b
erro = max (abs(x2-x1));

while(erro > 0.001)
       x1 = x2
       x2 = -A * x1 + b;
       erro = max(abs(x2-x1));
end
x2