#include <math.h>
#include <stdio.h>

typedef struct{
    float x, y;
} Vetor2D;

void rotaciona (Vetor2D *vetor, float angulo){
    float radianos = angulo * M_PI / 180.0;
    float novo_x = vetor->x * cos(radianos) - vetor->y * sin(radianos);
    float novo_y = vetor->x * sin(radianos) + vetor->y * cos(radianos);
    vetor->x = novo_x;
    vetor->y = novo_y;
}

void escalona(Vetor2D *vetor, float k) {
    vetor->x *= k;
    vetor->y *= k;
}

void translada(Vetor2D *vetor, float dx, float dy) {
    vetor->x += dx;
    vetor->y += dy;
}

int main(){
    Vetor2D vetor;
    char operacao;
    float parametro1, parametro2;

    // Entrada inicial do vetor
    printf("Entre com o vetor inicial (x y): ");
    scanf("%f %f", &vetor.x, &vetor.y);

    // Leitura da sequência de operações
    printf("Entre com as operações: ");
    while (1) {
        scanf(" %c", &operacao);
        if (operacao == 'q') {
            break;
        }

        switch (operacao) {
            case 'r': // Rotaciona
                scanf("%f", &parametro1);
                rotaciona(&vetor, parametro1);
                break;

            case 's': // Escalona
                scanf("%f", &parametro1);
                escalona(&vetor, parametro1);
                break;

            case 't': // Translata
                scanf("%f %f", &parametro1, &parametro2);
                translada(&vetor, parametro1, parametro2);
                break;

            default:
                printf("Operação inválida!\n");
                break;
        }
    }

    // Saída das coordenadas finais do vetor
    printf("Vetor final: (%g, %g)\n", vetor.x, vetor.y);

    return 0;
}
