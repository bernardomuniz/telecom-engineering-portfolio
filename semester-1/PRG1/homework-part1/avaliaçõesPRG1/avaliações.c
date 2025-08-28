#include <stdio.h>

//Função que calcula o máximo entre duas notas:
float maximo (float x, float y){
    float max;  

    if (x > y) {
        max = x;
    }else {
        max = y;
    }
    
    return max;
}

float media (float x, float y, float z){
    float med;
    med = (x + y + z)/3;
    return med;
}


int arredonda(float x) {
    int arredondado = (int)x; // Parte inteira de x

    // Verifica se há parte decimal positiva
    if (x - arredondado >= 0.5) {
        arredondado++;  // Incrementa para arredondar para cima
    }
    
    return arredondado;
}

int main(){
    float p1, r1, p2, r2, p3, r3, nota1, nota2, nota3, media_notas, freq;

    printf("Entre com P1 e R1: ");
    scanf("%f%f", &p1, &r1);
    nota1 = maximo(p1, r1);
    printf("Entre com P2 e R2: ");
    scanf("%f%f", &p2, &r2);
    nota2 = maximo(p2, r2);
    printf("Entre com P3 e R3: ");
    scanf("%f%f", &p3, &r3);
    nota3 = maximo(p3, r3);
    printf("Entre com a frequência (%%): ");
    scanf("%f", &freq);

    media_notas = media(nota1, nota2, nota3);
    media_notas = arredonda(media_notas);

    if(media_notas >= 6 && freq >= 75){
        printf("Resultado final: %d\n", (int)media_notas);
        printf("Situação: aprovado\n");
    }else if(freq < 75){
        printf("Resultado final: 0\n");
        printf("Situação: reprovado\n");
    }else {
        printf("Resultado final: %d\n", (int)media_notas);
        printf("Situação: reprovado\n");
    }
    return 0;
}