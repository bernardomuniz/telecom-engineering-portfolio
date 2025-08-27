%Aula 1 - Introdução ao Matlab


v = 2*[1:5] - 1; %vetor impar (1 linha por uma coluna
vv = [2:2:10]; %caso não quiser que seje printtado na tela
vvv = v'; %vetor transposto
v2 = ones(1,10)*2; %vetor de 1 até 10 com todas as posições sendo 2
v2(1) = 1; %colocar o numero 1 na primeira posição do vetor
v2(end) = 1; %colocar o numero 1 na ultima posição

vp = [2:2:20];
vi = [1:2:19]; 
vi./vp; %multiplicar elemento a elemento

ones(5,5) * 8; %matriz 5x5 com tudo 8
eye(5,5); %matriz identidade (linhas, colunas)


rand(3,3) * 5; %matriz com numeros aleatorios de zero até 5
a = rand(4,3) * 4+1; %aleatoria de 1 até 5 - 4[0,1] + 1 => [1,5]
exp(a); %constante e(X) onde x é o expoente

a(3,1) = 1; % na linha tres na coluna 1, quero atribuir o numero 1. Se caso quiser colocar na linha toda ou na coluna toda, basta colocar :


reshape(a,6,2); %criar uma nova matriz com dimensões diferentes mantendo o mesmo numero
b = rand(3)* 4+1;
det(b); %determinante

vi = [1 6 1];
vp = [5 9 7];
cross(vi,vp) ;%produto vetorial
dot(vi,vp); %produto escalar
A = [vi;vp]; %matriz com vi e vp, com vi na primeira linha e vp na segunda. ";" quebra linha

V = [];
for i = 1:10 %i começando em 1 até 10
   V = [V; i*i];
   
end

x = [0:0.00001:10];
y= x.*x;%x ao quadrado
z = tan(x);
