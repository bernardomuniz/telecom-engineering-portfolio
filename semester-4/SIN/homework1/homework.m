clear all
clc

t = -10:0.01:20;
T = 2*pi;
w0 = (2*pi)/T;
x = 1/2;

for k=1:300
    x = x + ((((-exp(-j*k*w0*2*pi))/(j*k*w0*2*pi)) + ((-exp(-j*k*w0*2*pi) + 1)/(2*pi*T*(j*k*w0)^2))) * exp(j*k*w0*t)) + ((((-exp(-j*-k*w0*2*pi))/(j*-k*w0*2*pi)) + ((-exp(-j*-k*w0*2*pi) + 1)/(T*(j*-k*w0)^2*2*pi))) * exp(j*-k*w0*t));
end



figure(1)
title('Representacao de Fourier')
plot(t,real(x))
grid()
axis([-2*pi 6*pi -1 2])

%Detereminando os primeiros harmonicos

escala = 0:30
as = 1:3
ak = @(k) ((((-exp(-j.*k.*w0.*2.*pi))/(j.*k.*w0.*2.*pi)) + ((-exp(-j.*k.*w0.*2.*pi) + 1)/(2.*pi.*T.*(j.*k.*w0).^2))));
a1 = ak(1)
a2 = ak(2)
a3 = ak(3)

%Valores absolutos:

modulos = []

A = @(a) abs(a)

for i=1:3
  a = ak(i)
  modulos(i) = A(a)
end


figure(2)
title('Gráfico de módulo')
stem(modulos)
grid()
axis([0 4 -0.2 0.2])

%Determinando fase

fase1 = angle(a1)
fase2 = angle(a2)
fase3 = angle(a3)
fases = [fase1, fase2, fase3] 

figure(3)
title('Gráfico de fase')
stem(fases)
grid()
axis([0 4 -2 2])





