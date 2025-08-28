#include <math.h>
#include <stdio.h>

typedef struct{
    float x,y;
} Ponto;

int quadrante (Ponto p){
    int quadrante;
    if (p.x > 0 && p.y > 0) {
        quadrante = 1;
    }else if (p.x > 0 && p.y < 0) {
        quadrante = 4;
    }else if (p.x < 0 && p.y > 0) {
        quadrante = 2;
    }else if (p.x < 0 && p.y < 0) {
        quadrante = 3;
    }else {
        quadrante = 0;
    }
    return quadrante;
}

float distancia (Ponto p1, Ponto p2){
    return hypot(p2.x - p1.x, p2.y - p1.y);
}

Ponto ponto_medio(Ponto p1, Ponto p2){
    Ponto medio;
    medio.x = (p1.x + p2.x)/2;
    medio.y = (p1.y + p2.y)/2;
    return medio;
}

int main (){
    Ponto p1, p2, medio;
    float distancias;

    printf("Entre com o ponto 1: ");
    scanf("%f %f", &p1.x, &p1.y);
    printf("Entre com o ponto 2: ");
    scanf("%f %f", &p2.x, &p2.y);

    distancias = distancia(p1, p2);
    medio = ponto_medio(p1, p2);

    printf("Quadrante do ponto 1: %d\n", quadrante(p1));
    printf("Quadrante do ponto 2: %d\n", quadrante(p2));
    printf("Distância: %g\n", distancia(p1, p2));
    printf("Ponto médio: (%g, %g)\n",medio.x, medio.y);
    return 0;
}