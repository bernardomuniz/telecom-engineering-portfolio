%Transformada de Fourier Discreta (DFT)

%Exemplo 1
x = [4 3 2 1];
N = length(x); %N=4
X = zeros(1,N); %X = [0 0 0 0]
%Cálculo da DFT pela definição
for k = 0:N-1
for n = 0:N-1
X(k+1) = X(k+1) + x(n+1)*exp(-j*2*pi*n*k/N);
end
end
X1=X
%Pode-se obter o mesmo sinal utilizando a função fft()
X2=fft(x)


%Exemplo 2 - DFT do impulso unitário
N=5; %n° de amostras
n=0:N-1;%n = [0 1 2 3 4]
x=[1 0 0 0 0]; %valores do sinal manualmente
figure(1)
subplot(311);
stem(n,x)
title('Sinal x[n] - impulso');
k=0:N-1;
X=fft(x);
subplot(312);
stem(k,abs(X))
title('Magnitude da DFT');
subplot(313);
stem(k,angle(X))
title('Fase da DFT');

%Exemplo 3 - DFT de uma cte x[x] = cte
N=50;
n=0:N-1;
x=ones(1,N);
figure(2)
subplot(311);
stem(n,x)
title('Sinal x[n] - constante');
k=0:N-1;
X=fft(x,N);
subplot(312);
stem(k,abs(X))
title('Magnitude da DFT');
subplot(313);
stem(k,angle(X))
title('Fase da DFT');

%Exemplo 4 - DFT de 5 pontos x[n] = delta[n] + delta[n-1] + delta[n-2]
N=5;
n=0:N-1;
x=[1 1 1 0 0 ];
figure(3)
subplot(311);
stem(n,x)
title('Sinal x[n]');
k=0:N-1;
X=fft(x,N);
subplot(312);
stem(k,abs(X))
title('Magnitude da DFT');
subplot(313);
stem(k,angle(X))
title('Fase da DFT');

%Exemplo 5 - DFT de 10 pontos de x[n] = u[n] - 2*u[n-5] + u[n-9]
N=10;
n=0:N-1;
x=[1 1 1 1 1 -1 -1 -1 -1 -1];
figure(4)
subplot(311);
stem(n,x)
title('Sinal x[n]');
k=0:N-1;
X=fft(x);
subplot(312);
stem(k,abs(X))
title('Magnitude da DFT');
subplot(313);
stem(k,angle(X))
title('Fase da DFT');

%Exemplo 6
N=6;
k=0:N-1;
n=0:N-1;
x=[4 3 2 1 0 0];
figure(5)
subplot(211);
stem(n,x)
title('Sinal x[n]');
X=fft(x);
Y=exp(j*2*pi*4*k/6).*X;
y=ifft(Y);
subplot(212);
stem(n,abs(y));
title('Sinal y[n]');

%Exemplo 7
N=5;
n=0:N-1;
x=[2 1 0 1 0 ];
figure(6)
subplot(311);
stem(n,x);
title('Sinal x[n]');
X=fft(x);
Y=X.^2;
y=ifft(Y);
subplot(312);
stem(n,y);
title('Sinal y[n] pela DFT');
subplot(313);
stem(n,cconv(x,x,5));
title('Sinal y[n] pela convolução');

%Exemplo 8
N=5;
n=0:N-1;
x=[1 3 3 2 0];
h=[1 1 1 1 0];
figure(7)
subplot(411);
stem(n,x)
title('Sinal x[n]');
subplot(412);
stem(n,h)
title('Sinal h[n]');
X=fft(x);
H=fft(h);
Y=X.*H;
y=ifft(Y);
subplot(413);
stem(n,y);
title('Sinal y[n] obtido pela DFT');
subplot(414);
stem(n,cconv(x,h,5));
title('Sinal y[n] obtido pela convolução');


%Exemplo 9 - DFT inversa
N=10;
n=0:N-1;
x=[1 1 1 1 1 1 0 0 0 0];
figure(8)
subplot(211);
stem(n,x);
title('Sinal x[n]');
X=fft(x);
Y=X.*conj(X);
y=ifft(Y);
subplot(212);
stem(n,y);
title('Sinal y[n]');


%Exemplo 10
amplitude_1 = 1;
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
figure(9);
plot(time,x_clean);

figure(10);
plot(time,x_noisy);

XC = fft(x_clean);
L=length(XC);
XC = abs(2*XC/L);
XC=fftshift(XC);
freq = Fs*(-(L/2):(L/2)-1)/L;
plot(freq,XC)
axis([-100 100 -1 6])

XC = fft(x_clean);
L=length(XC);
XC = abs(2*XC/L);
XC=fftshift(XC);
freq = Fs*(-(L/2):(L/2)-1)/L;
plot(freq,XC)
axis([-100 100 -1 6])
XN = fft(x_noisy);
XN = abs(2*XN/L);
XN=fftshift(XN);
freq = Fs*(-(L/2):(L/2)-1)/L;
plot(freq,XN)
axis([-100 100 -1 6])

N=10;
b = ones(1,N);
y2 = conv(x_noisy,b/N);
y1 = filter(b,N,x_noisy);
Y = fft(y2);
L=length(Y);
Y = abs(2*Y/L);
Y=fftshift(Y);
freq = Fs*(-(L/2):(L/2)-1)/L;
plot(freq,Y)
axis([-100 100 -1 6])
