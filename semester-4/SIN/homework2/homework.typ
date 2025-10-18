#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Representação de sinais periódicos
  de tempo contínuo em série de Fourier",
  subtitle: "Sinais e Sistemas",
  authors: ("Bernardo Souza Muniz e Ygor Martins.",),
  date: "11 de Outubro de 2025",
  doc,
)

= Introdução
Este documento tem o objetivo de mostrar a mostrar os passos para representar um sinal periódico de tempo contínuo através da Série de Fourier. Além disso, será mostrado os gráficos de fase e módulo do sinal em questão e os passos feitos para chegar até a resposta do exercício.

= Determinando os coeficientes de Fourier
Para descrever o sinal em questão, deve-se considerar o seguinte sinal:
\
\
#figure(
  figure(
    image("sinais.png", width: 100%),
    numbering: none,
    caption: [Sinal $y(t)$]
  ),
  caption: figure.caption([Material disponibilizado pela docente], position: top)
)
\
Inicialmente, devemos notar que o período do sinal é $T = 2pi$.

\
Para calcular os valores de coeficientes para $k=0$ e $k != 0$, usamos a seguinte equação:


$
a_k = 1/T integral_(x_0)^(x_0 + T) y(t) " "e^(-j k w_0 t)" "d t 
$

Devemos observar que o sinal periódico entre o intervalo $0 <= t <= 2pi$ é dado pela reta: 

$
y(t) = t/(2 pi)
$

Para $k = 0$, ao substituir os valores na equação (1), temos a seguinte integral:

$
a_0 = 1/T integral_0^(2pi) t/(2pi) · e^(-j (0) w_0 t)" "d t = 1/(2 pi T)(t^2/2 divides_0^(2pi)) = 1/(2 pi T) (((2pi)^2 - 0^2)/2) = (4pi^2)/(4pi T) = pi/T
$

Como $T = 2pi$, temos:
$
a_0 = pi/(2pi) => a_0 = 1/2
$

#pagebreak()

Para $k != 0$, ao substituir os valores na equação (1), temos a seguinte integral:

$
a_k = 1/T integral_(0)^(2 pi) t/(2pi) " "e^(-j k w_0 t)" "d t 
$

Para resolver a integral, devemos utilizar a relação de integração por partes:

$
integral u " "d v = u v-integral v · d u
$

Fazendo $u = t$ e $d v = e^(-j k w_0 t)$ na integral (5), temos:

$
a_k = 1/T integral_(0)^(2 pi) t/(2pi) " "e^(-j k w_0 t)" "d t  = 1/(2pi T)((-t e^(-j k w_0 t))/(j k w_0) - integral 1 · (-e^(-j k w_0 t)/(j k w_0)) d t)
$

Simplificando a expressão:

$
a_k = 1/T integral_(0)^(2 pi) t/(2pi) " "e^(-j k w_0 t)" "d t  = 1/(2pi T)((-t e^(-j k w_0 t))/(j k w_0) + 1/(j k w_0) integral e^(-j k w_0 t) d t) \
= 1/(2pi T)((-t e^(-j k w_0 t))/(j k w_0) + 1/(j k w_0) (-e^(-j k w_0 t)/(j k w_0))) = 1/(2pi T)((-t e^(-j k w_0 t))/(j k w_0) - e^(-j k w_0 t)/(j k w_0)^2 divides_0^(2pi))
$

Aplicando nos limites de integração:

$
 1/(2pi T)((-2pi e^(-j k w_0 2pi))/(j k w_0) - e^(-j k w_0 2pi)/(j k w_0)^2 -( (-0 ·e^(0))/(j k w_0) - e^(0)/(j k w_0)^2)) \
 = 1/(2pi T)((-2pi e^(-j k w_0 2pi))/(j k w_0) - (e^(-j k w_0 2pi) + 1)/(j k w_0)^2) 
$

Sabe-se que $T = 2pi$, substituindo no valor da variável e fazendo a distribuitiva do termo em evidência, temos que:

$
a_k=(-2pi e^(-j k w_0 2pi))/(2pi j k w_0) - (e^(-j k w_0 2pi) + 1)/(4pi^2(j k w_0)^2) 
$

Como $w_0 = (2pi)/T$ e $T = 2pi$, então $w_0 = 1$. Ao substituir no valor da igualdade de $a_k$, temos a resposta simplificada:

$
a_k=(-2pi e^(-j k  2pi))/(2pi j k ) - (e^(-j k  2pi) + 1)/(4pi^2(j k )^2) 
$

Portanto, temos os valores dos coeficientes de Fourier:

$
a_0 = 1/2 "  e  " a_k=(-2pi e^(-j k  2pi))/(2pi j k ) - (e^(-j k  2pi) + 1)/(4pi^2(j k )^2) 
$

#pagebreak()

= Simulação no Matlab
Para validar a resposta, foi elaborado um código no Software Matlab que simula os valores do coeficiente de Fourier para 300 amostras e depois feito o plot do gráfico.

#sourcecode[```matlab
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
```]
Ao verificar a plotagem do gráfico, o resultado obtido foi igual ao do sinal analisado na figura 1, o que confirma que os coeficiente calculados estão coerentes:
\
\
#figure(
  figure(
    image("plotfourier.png", width: 100%),
    numbering: none,
    caption: [Plotagem do gráfico $y(t)$ no Matlab] 
  ),
  caption: figure.caption([Elaborado pelo Autor], position: top)
)

= Gráficos de módulo de fase
Para os gráficos de módulo e fase, foi determinados as 3 primeiras harmônicas do sinal através do seguinte código:

#sourcecode[```matlab
%Detereminando os primeiros harmonicos
escala = 0:30
as = 1:3
ak = @(k) ((((-exp(-j.*k.*w0.*2.*pi))/(j.*k.*w0.*2.*pi)) + ((-exp(-j.*k.*w0.*2.*pi) + 1)/(2.*pi.*T.*(j.*k.*w0).^2))));
a1 = ak(1)
a2 = ak(2)
a3 = ak(3)

```]

Com os valores das harmônicas, foi possível verificar os valores absolutos e de a fase de cada harmônica:

#sourcecode[```matlab
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
```]

Os valores de módulo e fase das harmônicas calculados, foram:



$
a_1 = 0 + 0.1592i "  " a_2 = 0 + 0.0796i "  " a_3 = 0 + 0.0531i
\
\
\
abs(a_1) = 0.1592 "    " abs(a_2) = 0.0796"  " abs(a_3) = 0.0531
\
\
\
angle.spheric a_1 = 1.5708  "  " angle.spheric a_2 = 1.5708  "  " angle.spheric a_3 = 1.5708  
$

Os gráficos de módulo e fase dos seguintes valores foram representados da seguinte maneira:
\
\
#figure(
  figure(
    image("modulo.png", width: 100%),
    numbering: none,
    caption: [Gráfico de módulo] 
  ),
  caption: figure.caption([Elaborado pelo Autor], position: top)
)
\
#figure(
  figure(
    image("fase.png", width: 100%),
    numbering: none,
    caption: [Gráfico de fase] 
  ),
  caption: figure.caption([Elaborado pelo Autor], position: top)
)
#pagebreak()
= Código completo no Matlab

#sourcecode[```matlab
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






```]

= Conclusão

Portanto, podemos verificar que através do desenvolvimento da série de Fourier fomos capazes de representar o sinal utilizando deste artifício matemático. Além de obter o seu módulo tal como sua fase.
