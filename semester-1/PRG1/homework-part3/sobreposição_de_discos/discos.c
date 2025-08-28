#include <math.h>
#include <stdio.h>

typedef struct{
    float x,y;
} Ponto;

typedef struct{
    Ponto centro;
    float raio;
} Disco;

float distancia(Ponto p1, Ponto p2){
    return hypot(p2.x - p1.x, p2.y - p1.y);
}

int sobrepoem(Disco c1, Disco c2){
    float raio, distancia_centro;
    
    raio = c1.raio + c2.raio;
    distancia_centro = distancia(c1.centro, c2.centro);
    if (distancia_centro < raio) {
        return 1;
    }else {
        return 0;
    }
}

int main(){
    Disco disco1, disco2;
    int sobrepocisao;

    printf("Entre com o centro do disco 1: ");
    scanf("%f %f", &disco1.centro.x, &disco1.centro.y);
    printf("Entre com o raio do disco 1: ");
    scanf("%f", &disco1.raio);

    printf("Entre com o centro do disco 2: ");
    scanf("%f %f", &disco2.centro.x, &disco2.centro.y);
    printf("Entre com o raio do disco 2: ");
    scanf("%f", &disco2.raio);

    sobrepocisao = sobrepoem(disco1, disco2);

    if (sobrepocisao) {
        printf("Os discos se sobrepõem\n");
    }else{
        printf("Os discos não se sobrepõem\n");
    }
    return 0;
}