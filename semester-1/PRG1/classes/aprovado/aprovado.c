#include <stdio.h>
#include <stdbool.h>
#include <math.h>

int main(){
    int freq, conceito;
    float nota1, nota2 ,p1, p1_2, r1, p2, r2, media;
    bool aprovado;
    
    printf("Entre com P1.1, P1.2 e R1: ");
    scanf("%f%f%f", &p1, &p1_2, &r1);
    printf("Entre com P2 e R2: ");
    scanf("%f%f", &p2, &r2);
    printf("Entre com a frequência (em porcentagem): ");
    scanf("%d", &freq);

    p1 = p1 + p1_2;
    nota1 = fmax(p1, r1);
    nota2 = fmax(p2, r2);

    media = (nota1 + nota2)/2;
    conceito = round(media); //Arredondar para mais.

    aprovado = media > 7 && freq > 70;

    printf("Média: %.2f\n", media);
    printf("Conceito final: %d\n", conceito);
    printf("Aprovado: %d\n", aprovado);

    return 0;
}