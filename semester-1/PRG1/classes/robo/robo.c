#include <stdio.h>

typedef struct{
    float x, y; //Representa um ponto no plano cartesiano
}Ponto;

void mover_ponto(Ponto *p, char direcao, float distancia);
float calcular_distancia(Ponto p1, Ponto p2);


int main (){
    Ponto r1 = {0,0};
    Ponto r2 = {10,10};
    int i;

    printf("Entre com os movimentos do robo 1: ");
    while (i != '\n') {
        scanf("%c %f", )
    }




    return 0;
}