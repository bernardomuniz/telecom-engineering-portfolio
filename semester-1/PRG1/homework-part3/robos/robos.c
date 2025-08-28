#include <math.h>
#include <stdio.h>


typedef struct{
    float x, y;
} Ponto;

void mover_ponto(Ponto *p, char direcao, float distancia){
    switch (direcao) {
        case 'N': p->y += distancia ;break;
        case 'S': p->y -= distancia;break;
        case 'L': p->x += distancia; break;
        case 'O': p->x -= distancia; break;
    }
}

float calcular_distancia(Ponto p1, Ponto p2){
    return hypot(p2.x - p1.x, p2.y - p1.y);
}

int main(){
    Ponto robo1 = {0,0}, robo2 = {10,10};
    char movimento;
    float distancia,distancia_robos;

    printf("Entre com os movimentos do robô 1: ");
    for (int i = 0; i < 3; i++) {
        scanf(" %c %f", &movimento, &distancia);
        mover_ponto(&robo1, movimento, distancia);
    }

    printf("Entre com os movimentos do robô 2: ");
    for (int i = 0; i < 3; i++) {
        scanf(" %c %f", &movimento, &distancia);
        mover_ponto(&robo2, movimento, distancia);
    }
    distancia_robos = calcular_distancia(robo1, robo2);

    printf("Posição final do robô 1: (%g, %g)\n", robo1.x, robo1.y);
    printf("Posição final do robô 2: (%g, %g)\n", robo2.x, robo2.y);
    printf("Distância entre os robôs: %g", distancia_robos);

    return 0;
}