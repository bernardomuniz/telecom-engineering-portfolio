clear all
clc

%LETRA A

n = -20:20;
N = 7;
N1 = 4;
x = 5/N;

for k=1:N-1
    x = x + (1/N*((exp(-j*k*(2*pi/N)*(N1+1)) - 1)/(exp(-j*k*(2*pi/N)) - 1)))*exp(j*k*(2*pi/N).*n);
end



figure(1)
stem(n,real(x))
title('Representacao de Fourier - Questão A')
grid();
axis([-20 20 -1 2])

%LETRA B

n = -20:20;
N = 6;
N1 = 3;
x = 4/N;

for k=1:N-1
    x = x + (1/N*((exp(-j*k*(2*pi/N)*(N1+1)) - 1)/(exp(-j*k*(2*pi/N)) - 1) ))*exp(j*k*(2*pi/N).*n);
end



figure(2)
stem(n,real(x))
title('Representacao de Fourier - Questão B')
grid();
axis([-20 20 -1 2])

%LETRA C

n = -20:20;
N = 6;
N1 = 5;
x = 3/N;

for k=1:N-1
    x = x + (1/N*(1 + (2*exp(-j*k*(2*pi/N))) - (exp(-j*k*(2*pi/N)*2)) - (exp(-j*k*(2*pi/N)*4)) + (2*exp(-j*k*(2*pi/N)*5)) ))*exp(j*k*(2*pi/N).*n);
end

figure(3)
stem(n,real(x))
title('Representacao de Fourier - Questão C')
grid();
axis([-20 20 -2 4])

