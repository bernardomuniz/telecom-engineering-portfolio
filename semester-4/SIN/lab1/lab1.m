clear all
clc

%Sinais contínuos e discretos
f=@(t) exp(-t).*cos(2*pi*t); %definição da senoide

%Calculando valores para f(t)
t=0;
f(t)

%Traçando os valores de f(t) em tempo contínuo e discreto
t = -2:2; %vetor de valores inteiros contendo [-2,-1,0,1,2] - tempo discreto
f(t)

%Plot do gráfico de f(t)
plot(t,f(t))
xlabel('t');
ylabel('f(t)');grid;

%Plot de um novo formato do gráfico de f(t), neste caso é possível observar
%os pontos inteiros do tempo discreto
stem(f(t))

%Traçando uma nova linha de valores para f(t) em tempo contínuo

%Se poucos pontos forem escolhidos perde-se
%informação. Se muitos pontos forem escolhidos, perderemos memória e tempo. 
%É necessário atingir um equilíbrio. 
%Para funções oscilatórias, a utilização de 20 a 200 pontos por oscilação geralmente é adequada
%Neste caso foi utilizado 100 pontos.
t=-2:0.01:2;
plot(t,f(t))
xlabel('t');
ylabel('f(t)');grid;

%Traçando uma senoide em tempo discreto no intervalo de [-30 <= x <= 30]

n=-30:30; %intervalo de 1 em 1
x = cos(n*pi/12+pi/4);
figure(2)
stem(n,x);
xlabel('n');
ylabel('x[n]');


%Agora vamos considerar um sinal senoidal no tempo continuo amostrado
%a uma frequência de 1000Hz é corrompido por uma pequena quantidade de ruíıdo. Esse sinal é gerado pelos seguintes
%comandos:
amplitude_1 = 5;
freq_1 = 5;
amplitude_2 = 2;
freq_2 = 50;
Fs = 1000;
time = 0:1/Fs:(1-1/Fs);
sine_1 = amplitude_1*sin(2*pi*freq_1.*time);
sine_2 = amplitude_2*sin(2*pi*freq_2.*time);
noise = randn(1,length(time));
x_clean = sine_1 + sine_2;
x_noisy = x_clean + noise;
figure(14);
plot(time,x_clean);

%uma nova forma de visualizar o mesmo sinal
figure(15);
plot(time,x_noisy);

