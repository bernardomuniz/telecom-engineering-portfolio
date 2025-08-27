%Aula 2 - Erro de overflow e underflow

x = sqrt(3);
y = sqrt(5);
z = sqrt(8);
c1 = (x + y) + z;
c2 = x + (y + z);

erro = c1 - c2
%format long/short => Printar com mais ou menos casas decimais em um número
%infinito

s = 0;
val = 0.999;
numero = 1000000;
for i = 1: numero
    s = s + val;
end
s
s_exato = numero * val;
erro = s_exato - s;

x = 10^-300;
y = 10^30;
z = 10^300;

c1 = (x/y)*z %under flow, pois x/y = 10^-330, o Mtlb entende que é quae zero, e tranforma o resultado em zero
