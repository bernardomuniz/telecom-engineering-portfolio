%LABORATÓRIO 1 - PROCESSAMENTO DE SINAIS DIGITAIS

% Faça o sinal analógico inicial
% (frequency 20 Hz)
[m,t] = makecos(20);

%Vamos fazer um trem de impulso para amostrar nosso sinal
% (frequência de amostragem de 50 Hz)
[it1,ts1] = makeimp(50);
% Agora amostre o sinal original
ms1 = sampleit1(t,m,ts1);
% Plote todos os sinais para visualizer o processo de amostragem
c1 = 'r'; % cor para o primeiro cenário
smpl_plot(t,m,ts1,it1,ms1,c1);

% Agora faça um segundo trem de impulsos
% (frequência de amostragem de 30 Hz menor que a taxa de Nyquist)
[it2,ts2] = makeimp(30);
% Agora amostre o sinal original com a nova taxa de amostragem
ms2 = sampleit1(t,m,ts2);
% Plote todos os sinais para visualizer o processo de amostragem
c2 = 'g'; % cor para o Segundo cenário
smpl_plot(t,m,ts2,it2,ms2,c2);

% Agora reconstrua as duas versões amostradas
mr1 = interpsinc(ms1,ts1,t);
mr2 = interpsinc(ms2,ts2,t);
% Plote o sinal original e o sinal reconstruido para comparar
recon_plot(t,m,ts1,ms1,mr1,c1);
recon_plot(t,m,ts2,ms2,mr2,c2)

% Agora vamos obter o espectro para examinar o aliasing
% Faça o índice de frequência para plotagem
f = (-5000/2):(1/2):(5000/2); 
% Use a função do anexo para calcular o espectro
M = am_spectrum(m);
MR1 = am_spectrum(mr1);
MR2 = am_spectrum(mr2);
% Plote o espectro para comparar
am_plot(f,M,MR1,MR2,0.02);



