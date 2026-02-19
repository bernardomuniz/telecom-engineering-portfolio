%QUESTÕES
%Seguindo o procedimento descrito acima, verifique o aliasing e 
%calcule a frequência dos co-senos reconstruídos nos seguintes casos:

%Cosseno: 30Hz, Amostragem: 50Hz 
freq_cos = 30
freq_amostragem = 50
freq_nyquist = 2 * freq_cos

%Cosseno com frequência 30Hz
[m,t] = makecos(freq_cos);
%frequência de amostragem de nyquist
[it1,ts1] = makeimp(freq_nyquist);
ms1 = sampleit1(t,m,ts1); 
smpl_plot(t,m,ts1,it1,ms1,c1);

%frequência de amostragem pedida
[it2,ts2] = makeimp(freq_amostragem); 
ms2 = sampleit1(t,m,ts2); 

%Reconstruindo as duas versões amostradas
mr1 = interpsinc(ms1,ts1,t); 
mr2 = interpsinc(ms2,ts2,t); 

f = (-5000/2):(1/2):(5000/2); 
M = am_spectrum(m);
MR1 = am_spectrum(mr1);
MR2 = am_spectrum(mr2); 
am_plot(f,M,MR1,MR2,0.02);

%Cosseno: 40Hz, Amostragem: 15Hz 
freq_cos = 40
freq_amostragem = 15
freq_nyquist = 2 * freq_cos

%Cosseno com frequência 40Hz
[m,t] = makecos(freq_cos);
%frequência de amostragem de nyquist
[it1,ts1] = makeimp(freq_nyquist);
ms1 = sampleit1(t,m,ts1); 
smpl_plot(t,m,ts1,it1,ms1,c1);

%frequência de amostragem pedida
[it2,ts2] = makeimp(freq_amostragem); 
ms2 = sampleit1(t,m,ts2); 

%Reconstruindo as duas versões amostradas
mr1 = interpsinc(ms1,ts1,t); 
mr2 = interpsinc(ms2,ts2,t); 

f = (-5000/2):(1/2):(5000/2); 
M = am_spectrum(m);
MR1 = am_spectrum(mr1);
MR2 = am_spectrum(mr2); 
am_plot(f,M,MR1,MR2,0.02);

%Cosseno: 10Hz, Amostragem: 50Hz 
freq_cos = 10
freq_amostragem = 50
freq_nyquist = 2 * freq_cos

%Cosseno com frequência 10Hz
[m,t] = makecos(freq_cos);
%frequência de amostragem de nyquist
[it1,ts1] = makeimp(freq_nyquist);
ms1 = sampleit1(t,m,ts1); 
smpl_plot(t,m,ts1,it1,ms1,c1);

%frequência de amostragem pedida
[it2,ts2] = makeimp(freq_amostragem); 
ms2 = sampleit1(t,m,ts2); 

%Reconstruindo as duas versões amostradas
mr1 = interpsinc(ms1,ts1,t); 
mr2 = interpsinc(ms2,ts2,t); 

f = (-5000/2):(1/2):(5000/2); 
M = am_spectrum(m);
MR1 = am_spectrum(mr1);
MR2 = am_spectrum(mr2); 
am_plot(f,M,MR1,MR2,0.02);

%Cosseno: 20Hz, Amostragem: 40Hz 
freq_cos = 20
freq_amostragem = 40
freq_nyquist = 2 * freq_cos

%Cosseno com frequência 40Hz
[m,t] = makecos(freq_cos);
%frequência de amostragem de nyquist
[it1,ts1] = makeimp(freq_nyquist);
ms1 = sampleit1(t,m,ts1); 
smpl_plot(t,m,ts1,it1,ms1,c1);

%frequência de amostragem pedida
[it2,ts2] = makeimp(freq_amostragem); 
ms2 = sampleit1(t,m,ts2); 

%Reconstruindo as duas versões amostradas
mr1 = interpsinc(ms1,ts1,t); 
mr2 = interpsinc(ms2,ts2,t); 

f = (-5000/2):(1/2):(5000/2); 
M = am_spectrum(m);
MR1 = am_spectrum(mr1);
MR2 = am_spectrum(mr2); 
am_plot(f,M,MR1,MR2,0.02);




