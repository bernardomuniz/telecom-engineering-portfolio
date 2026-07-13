#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")


#show: doc => report(
  title: "Projeto de filtros",
  subtitle: "Processamento de Sinais Digitais",
  authors: ("Bernardo Souza Muniz.",),
  date: "29 de Junho de 2026",
  doc,
)

= Introdução
Este trabalho apresenta o desenvolvimento e a análise comparativa de filtros digitais FIR (_Finite Impulse Response_) e IIR (_Infinite Impulse Response_) implementados em ambiente MATLAB e no FDA Tool. 

O objetivo  é isolar três componentes senoidais distintas (750 Hz, 850 Hz e 900 Hz) presentes em um sinal de entrada amostrado a uma taxa de 8 kHz. Para isso, foram desenvolvidos 7 projetos de filtros, cujas especificações, desempenhos e critérios de escolha são documentados ao longo do relatório.
\

= Análise do sinal no domínio do tempo e da frequência
Para analisar o comportamento do sinal a ser filtrado, foi desenvolvido um código em MATLAB que permite a sua visualização tanto no domínio do tempo quanto no domínio da frequência.
\

== Código de Implementação (MATLAB)

#sourcecode[```matlab
clear all


%Ordem do sinal
M=71;


tmin=0;
tmax=2;
Fs=8000; %Frequencia de amostragem
Ts= 1/Fs; %Período de amostragem


L=(tmax-tmin)/Ts;
t=0:Ts:tmax-Ts;
s=sin(2*pi*750*t)+ sin(2*pi*850*t) + sin(2*pi*900*t);
S=fft(s);
S=abs(2*S/L);
S=fftshift(S);
freq= Fs*(-(L/2):(L/2)-1)/L;



%Graficos do sinal
figure(1)
subplot(3,1,1),plot(t,s);
title('Sinal')
xlabel('t')
ylabel('s(t)')
subplot(3,1,2),plot(freq,S)
title('Espectro de Amplitude de s(t)')
xlabel('f (Hz)')
ylabel('|S(f)|')
```]
== Representação no Domínio do Tempo e da Frequência
Os gráficos do sinal do domínio do tempo e da frequência gerados a partir do código no MATLAB são mostrados na figura a seguir.
#figure(
  figure(
    rect(image("plotdosinal.png", width:100%)),
    numbering: none,
    caption: [Gráfico do sinal a ser filtrado no domínio do tempo e da frequência]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Estruturas de filtros FIR e IIR
Para realizar a implementação em MATLAB dos filtros FIR e IIR, foi utilizada a função de transferência de cada estrutura. As equações (1) e (2) abaixo demonstram as funções que foram utilizadas.

== Estrutura de filtros FIR

$
H(z) = a_0 + a_1 z^(-1) + a_2 z^(-2) + ... + a_N z^(-N)
$

O filtro FIR é caracterizado por possuir apenas zeros, sem polos fora da origem. Além disso, é possível verificar que possui coeficientes somente no numerador.

== Estrutura de filtros IIR

$
H(z) = (a_0 + a_1 z^(-1) + a_2 z^(-2) + ... + a_N z^(-N)) / (b_0 + b_1 z^(-1) + b_2 z^(-2) + ... + b_N z^(-N))
$

O filtro IIR possui tanto zeros quanto polos, sendo a estabilidade condicionada à localização dos polos dentro do círculo unitário do plano Z. É possível verificar que a estrutura possui coeficientes tanto no numerador quanto no denominador.
\
\
Para a determinação dos coeficientes $a$ e $b$, foi utilizado o software FDA Tool.
= Código MATLAB para filtragem das componentes
== Código para filtros FIR
Para visualização dos gráficos de cada componente filtrada nos filtros FIR, foi utilizado o denominador com valor 1 e os numeradores com os valores exportados do FDA Tool. 
#sourcecode[```matlab
close all
den_low = 1;
num_low = Num_FDATOOL;
den_high = 1;
num_high = Num_FDATOOL;

tmin = 0;             
tmax = 2;
Fs=8000;
Ts=1/Fs;
L=(tmax-tmin)/Ts;

t=0:Ts:tmax-Ts;             
s = sin(2*pi*750*t) + sin(2*pi*850*t) + sin(2*pi*900*t);
S = fft(s);
S = abs(2*S/L);
S = fftshift(S);  

figure,freqz(num_low,den_low);
s_f_low = filter(num_low,den_low,s);
S_F_low = fft(s_f_low);
S_F_low = abs(2*S_F_low/L);
S_F_low=fftshift(S_F_low);      

figure,freqz(num_high,den_high);
 
s_f_high = filter(num_high,den_high,s);
S_F_high = fft(s_f_high);
S_F_high = abs(2*S_F_high/L);
S_F_high=fftshift(S_F_high);      

%% Gráficos
freq = Fs*(-(L/2):(L/2)-1)/L;
subplot(4,1,1),plot(t,s);
title('Sinal')
xlabel('t')
ylabel('s(t)')
subplot(4,1,2),plot(freq,S)
title('Espectro de Amplitude de s(t)')
xlabel('f (Hz)')
ylabel('|S(f)|')
subplot(4,1,3),plot(freq,S_F_low)
title('Espectro de Amplitude do sinal Filtrado - baixa frequência')
xlabel('f (Hz)')
ylabel('|S(f)|')
subplot(4,1,4),plot(freq,S_F_high)
title('Espectro de Amplitude do sinal Filtrado - alta frequência')
xlabel('f (Hz)')
ylabel('|S(f)|')
```]
== Código para filtros IIR
Para visualização dos gráficos de cada componente filtrada nos filtros IIR, foi utilizado tanto o denominador quanto o  numerador com os valores exportados do FDA Tool.
#sourcecode[```matlab
close all
den_low = Den_FDATOOL;
num_low = Num_FDATOOL;
den_high = Den_FDATOOL;
num_high = Num_FDATOOL;

tmin = 0;             
tmax = 2;
Fs=8000;
Ts=1/Fs;
L=(tmax-tmin)/Ts;

t=0:Ts:tmax-Ts;             
s = sin(2*pi*750*t) + sin(2*pi*850*t) + sin(2*pi*900*t);
S = fft(s);
S = abs(2*S/L);
S = fftshift(S);  

figure,freqz(num_low,den_low);
s_f_low = filter(num_low,den_low,s);
S_F_low = fft(s_f_low);
S_F_low = abs(2*S_F_low/L);
S_F_low=fftshift(S_F_low);      

figure,freqz(num_high,den_high);
 
s_f_high = filter(num_high,den_high,s);
S_F_high = fft(s_f_high);
S_F_high = abs(2*S_F_high/L);
S_F_high=fftshift(S_F_high);      

%% Gráficos
freq = Fs*(-(L/2):(L/2)-1)/L;
subplot(4,1,1),plot(t,s);
title('Sinal')
xlabel('t')
ylabel('s(t)')
subplot(4,1,2),plot(freq,S)
title('Espectro de Amplitude de s(t)')
xlabel('f (Hz)')
ylabel('|S(f)|')
subplot(4,1,3),plot(freq,S_F_low)
title('Espectro de Amplitude do sinal Filtrado - baixa frequência')
xlabel('f (Hz)')
ylabel('|S(f)|')
subplot(4,1,4),plot(freq,S_F_high)
title('Espectro de Amplitude do sinal Filtrado - alta frequência')
xlabel('f (Hz)')
ylabel('|S(f)|')
```]

= Determinação das frequências de corte
Considerando que as frequências centrais ($f_c$) das componentes senoidais a serem isoladas são conhecidas (750 Hz, 850 Hz e 900 Hz), adotou-se o critério da média geométrica para o determinação das bandas. Para cada filtro, foi estabelecido arbitrariamente um limite para a frequência de corte inferior ($f_i$) e, a partir deste valor, foi determinado a frequência de corte superior ($f_s$).
\
\
A equação utilizada para determinação da banda de corte superior é dada pela seguinte equação:
\
\
$
f_c = sqrt(f_i dot f_s)
$
\
 Elevando os dois lados da equação ao quadrado, chegamos em uma relação que permite determinar o valor da frequência de corte superior:
\
$
f_s = f_c^2/f_i
$
\
= Filtragem da faixa de 750 Hz
Para iniciar o projeto de filtragem da componente de 750Hz , definiu-se inicialmente a frequência de corte inferior em 725 Hz. A partir da Equação $(4)$, determinou-se a frequência de corte superior correspondente:
\
\

$
f_s = f_c^2/f_i =750^2/725 => f_s approx  775 "Hz"
$
\
Para validar a eficácia do isolamento da componente desejada, os tópicos a seguir apresentam os resultados obtidos a partir de diferentes modelos de filtros. 
A fim de garantir a mesma condição de teste, utilizou-se a mesma banda de passagem (725Hz a 775Hz) em todos os modelos de filtros avaliados para esta componente.
\
\
== Filtros FIR
=== Janela de Blackman

#figure(
  figure(
    rect(image("750/blackman/fig2.png", width:90%)),
    numbering: none,
    caption: [Projeto do filtro Blackman no FDA Tool para a componente de 750 Hz]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("750/blackman/fig1.png", width:91%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência. ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("750/blackman/fig3.png", width:91%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Janela de Hamming

#figure(
  figure(
    rect(image("750/hamming/fig2.png", width:100%)),
    numbering: none,
    caption: [Projeto do filtro Hamming no FDA Tool para a componente de 750 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("750/hamming/fig1.png", width:93%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("750/hamming/fig3.png", width:91%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Janela de Kaiser

#figure(
  figure(
    rect(image("750/kaiser/fig2.png", width:100%)),
    numbering: none,
    caption: [Projeto do filtro Kaiser no FDA Tool para a componente de 750 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#figure(
  figure(
    rect(image("750/kaiser/fig1.png", width:93%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("750/kaiser/fig3.png", width:91%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Janela Retangular

#figure(
  figure(
    rect(image("750/retangular/fig2.png", width:100%)),
    numbering: none,
    caption: [Projeto do filtro utilizando a janela retangular no FDA Tool para a componente de 750 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#figure(
  figure(
    rect(image("750/retangular/fig1.png", width:93%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("750/retangular/fig3.png", width:90%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
== Filtros IIR

=== Butterworth

#figure(
  figure(
    rect(image("750/Butterworth/fig2.png", width:85%)),
    numbering: none,
    caption: [Projeto do filtro Butterworth no FDA Tool para a componente de 750 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#figure(
  figure(
    rect(image("750/Butterworth/fig1.png", width:90%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("750/Butterworth/fig3.png", width:91%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Chebyshev

#figure(
  figure(
    rect(image("750/Chebyshev/fig1.png", width:90%)),
    numbering: none,
    caption: [Projeto do filtro Chebyshev no FDA Tool para a componente de 750 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("750/Chebyshev/fig3.png", width:90%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("750/Chebyshev/fig2.png", width:90%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Elíptico

#figure(
  figure(
    rect(image("750/Ellip/fig3.png", width:90%)),
    numbering: none,
    caption: [Projeto do filtro Elíptico no FDA Tool para a componente de 750 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("750/Ellip/fig2.png", width:90%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
#figure(
  figure(
    rect(image("750/Ellip/fig1.png", width:90%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
\
= Filtragem da faixa de 850 Hz
Para iniciar o projeto de filtragem da componente de 850Hz , definiu-se inicialmente a frequência de corte inferior em 825 Hz. A partir da Equação $(4)$, determinou-se a frequência de corte superior correspondente:
\
\

$
f_s = f_c^2/f_i =850^2/825 => f_s approx  875 "Hz"
$
\
Para validar a eficácia do isolamento da componente desejada, os tópicos a seguir apresentam os resultados obtidos a partir de diferentes modelos de filtros. 
A fim de garantir a mesma condição de teste, utilizou-se a mesma banda de passagem (825Hz a 875Hz) em todos os modelos de filtros avaliados para esta componente.
\
\
== Filtros FIR
=== Janela de Blackman

#figure(
  figure(
    rect(image("850/blackman/fig3.png", width:85%)),
    numbering: none,
    caption: [Projeto do filtro Blackman no FDA Tool para a componente de 850 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("850/blackman/fig1.png", width:85%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
#figure(
  figure(
    rect(image("850/blackman/fig2.png", width:90%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
=== Janela de Hamming
#figure(
  figure(
    rect(image("850/hamming/fig3.png", width:90%)),
    numbering: none,
    caption: [Projeto do filtro Hamming no FDA Tool para a componente de 850 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("850/hamming/fig1.png", width:90%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
#figure(
  figure(
    rect(image("850/hamming/fig2.png", width:90%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Janela de Kaiser

#figure(
  figure(
    rect(image("850/kaiser/fig3.png", width:90%)),
    numbering: none,
    caption: [Projeto do filtro Kaiser no FDA Tool para a componente de 850 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("850/kaiser/fig2.png", width:90%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
#figure(
  figure(
    rect(image("850/kaiser/fig1.png", width:90%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Janela Retangular
#figure(
  figure(
    rect(image("850/retangular/fig3.png", width:90%)),
    numbering: none,
    caption: [Projeto do filtro Retangular no FDA Tool para a componente de 850 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("850/retangular/fig1.png", width:90%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
#figure(
  figure(
    rect(image("850/retangular/fig2.png", width:83%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Filtros IIR
=== Butterworth
#figure(
  figure(
    rect(image("850/Butterworth/fig3.png", width:82%)),
    numbering: none,
    caption: [Projeto do filtro Butterworth no FDA Tool para a componente de 850 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("850/Butterworth/fig1.png", width:86%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("850/Butterworth/fig2.png", width:90%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Chebyshev

#figure(
  figure(
    rect(image("850/Chebyshev/fig1.png", width:85%)),
    numbering: none,
    caption: [Projeto do filtro Chebyshev no FDA Tool para a componente de 850 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("850/Chebyshev/fig3.png", width:90%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
#figure(
  figure(
    rect(image("850/Chebyshev/fig2.png", width:85%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Elíptico

#figure(
  figure(
    rect(image("850/Ellip/fig1.png", width:85%)),
    numbering: none,
    caption: [Projeto do filtro Elíptico no FDA Tool para a componente de 850 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("850/Ellip/fig3.png", width:90%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
#figure(
  figure(
    rect(image("850/Ellip/fig2.png", width:90%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
\
= Filtragem da faixa de 900 Hz
Para iniciar o projeto de filtragem da componente de 900Hz , definiu-se inicialmente a frequência de corte inferior em 875 Hz. A partir da Equação $(4)$, determinou-se a frequência de corte superior correspondente:
\
\

$
f_s = f_c^2/f_i =900^2/875 => f_s approx  925 "Hz"
$
\
Para validar a eficácia do isolamento da componente desejada, os tópicos a seguir apresentam os resultados obtidos a partir de diferentes modelos de filtros. 
A fim de garantir a mesma condição de teste, utilizou-se a mesma banda de passagem (875Hz a 925Hz) em todos os modelos de filtros avaliados para esta componente.
\
\
== Filtros FIR
=== Janela de Blackman

#figure(
  figure(
    rect(image("900/blackman/fig1.png", width:100%)),
    numbering: none,
    caption: [Projeto do filtro Blackman no FDA Tool para a componente de 900 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("900/blackman/fig2.png", width:100%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
\
#figure(
  figure(
    rect(image("900/blackman/fig3.png", width:100%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
=== Janela de Hamming

#figure(
  figure(
    rect(image("900/hamming/fig1.png", width:100%)),
    numbering: none,
    caption: [Projeto do filtro Hamming no FDA Tool para a componente de 900 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
#figure(
  figure(
    rect(image("900/hamming/fig2.png", width:100%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
\
#figure(
  figure(
    rect(image("900/hamming/fig3.png", width:100%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
=== Janela de Kaiser

#figure(
  figure(
    rect(image("900/kaiser/fig1.png", width:100%)),
    numbering: none,
    caption: [Projeto do filtro Kaiser no FDA Tool para a componente de 900 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
#figure(
  figure(
    rect(image("900/kaiser/fig2.png", width:100%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
\
#figure(
  figure(
    rect(image("900/kaiser/fig3.png", width:100%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
=== Janela Retangular

#figure(
  figure(
    rect(image("900/retangular/fig1.png", width:100%)),
    numbering: none,
    caption: [Projeto do filtro Retangular no FDA Tool para a componente de 900 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
#figure(
  figure(
    rect(image("900/retangular/fig2.png", width:100%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\

#figure(
  figure(
    rect(image("900/retangular/fig3.png", width:100%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Filtros IIR
=== Butterworth

#figure(
  figure(
    rect(image("900/Butterworth/fig1.png", width:90%)),
    numbering: none,
    caption: [Projeto do filtro Butterworth no FDA Tool para a componente de 900 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
#figure(
  figure(
    rect(image("900/Butterworth/fig3.png", width:100%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\

#figure(
  figure(
    rect(image("900/Butterworth/fig2.png", width:100%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Chebyshev

#figure(
  figure(
    rect(image("900/Chebyshev/fig1.png", width:100%)),
    numbering: none,
    caption: [Projeto do filtro Chebyshev no FDA Tool para a componente de 900 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
#figure(
  figure(
    rect(image("900/Chebyshev/fig3.png", width:100%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\

#figure(
  figure(
    rect(image("900/Chebyshev/fig2.png", width:100%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
=== Elíptico

#figure(
  figure(
    rect(image("900/Elliptcal/fig1.png", width:100%)),
    numbering: none,
    caption: [Projeto do filtro Elípitco no FDA Tool para a componente de 900 Hz.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
#figure(
  figure(
    rect(image("900/Elliptcal/fig3.png", width:100%)),
    numbering: none,
    caption: [Espectro do sinal original e do sinal filtrado em baixa e alta frequência.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\

#figure(
  figure(
    rect(image("900/Elliptcal/fig2.png", width:100%)),
    numbering: none,
    caption: [Resposta de magnitude e fase em frequência normalizada.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Tabela de comparação de resultados
A tabela abaixo realiza uma comparação entre cada filtro com base na ordem usada no software FDA Tool.


#figure(
  figure(
    text(size: 10pt)[
      #table(
        align: center,
        columns: 5,
        inset: 10pt,
        [*Filtro*], [*Tipo*], [*750 Hz*], [*850 Hz*], [*900 Hz*],
        [Blackman],    [FIR], [240], [670], [640],
        [Hamming],     [FIR], [175], [490], [465],
        [Kaiser],      [FIR], [790], [485], [795],
        [Retangular],  [FIR], [630], [795], [790],
        [Butterworth], [IIR], [12],  [12],  [12],
        [Chebyshev],   [IIR], [8],   [8],   [8],
        [Elíptico],    [IIR], [6],   [6],   [6],
      )
    ],
    numbering: none,
    caption: [Ordem utilizada em cada filtro, projetado no FDA Tool, por frequência]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
#text(size: 11pt, style: "italic")[
  Nota: os filtros FIR (Blackman, Hamming, Kaiser, Retangular) tiveram sua ordem especificada manualmente através da opção "Specify order". Já os filtros IIR (Butterworth, Chebyshev, Elíptico) utilizaram a opção "Minimum order", na qual o MATLAB calcula automaticamente a menor ordem para realizar a filtragem com base nas especificações de banda que foram definidas.
]

= Conclusão

A partir da análise das ordens obtidas para cada filtro projetado, foi possível observar que, entre os filtros do tipo FIR, a janela de Hamming apresentou a menor ordem nas três componentes espectrais analisadas. Em contrapartida, os filtros com janela Retangular e Kaiser apresentaram as maiores ordens, tendo um custo computacional muito mais elevado para isolar cada componente.

Já entre os filtros do tipo IIR, a estrutura Elíptica foi a que apresentou a menor ordem, mantendo-se em 6 para todas as três componentes analisadas. O Chebyshev e o Butterworth, exigiram ordens maiores (8 e 12, respectivamente) para conseguir realizar a filtragem das faixas de frequência analisadas.

De forma geral, os filtros IIR mostraram-se mais eficientes em termos de ordem quando comparados aos FIR, o que já era esperado devido à presença de polos em sua função de transferência.

#pagebreak()

= Teste
== Teste
=== teste