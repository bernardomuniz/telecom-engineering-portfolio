#include <stdio.h>

struct Circulo{ //definindo um tipo
    float centro_x, centro_y;
    float raio; //definindp um campo dentro de uma estrutura
    //Nada ainda é definido na memoria
};

typedef struct { //Dar preferencia para criar estruturas com esse formato
    float centro_x, centro_y;
    float raio; 
}Circulo;

typedef struct{
    char nome [100];
    int idade;
    float altura;
} AlunoDaInstituicao;

int main(){
    struct Circulo circ; //Agora a váriavel está definida eo tipo dela é struct
    struct Circulo circ2, circ3; //Pode-se criar mais variaveis com uma mesma estrutura
    Circulo circdef; //chamando uma estrutura com typedef


    //Fazendo uma estrutura, é possivel ter uma variavel que sempre pode ser chaamda para ser apontada para outra variavel
    //Acessando os campos da estrutura:
    //Para acessar os campos coloca-se variavel.campo (a variavel foi a criada com a estrutura)

    circ.centro_x = 2;
    circ.centro_y = 1;
    circ.raio = 1.5;
    circ2.raio = 2 * circ.raio; // 3.0
    printf("a");

    return 0;
}