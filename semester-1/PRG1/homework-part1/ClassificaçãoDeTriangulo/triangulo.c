#include <stdio.h>

int main(){
    float a, b, c;

    printf("Entre com os lados do triângulo: ");
    scanf("%f%f%f", &a, &b, &c);

    if (a + b < c || a + c < b || b + c < a){
        printf("Triângulo inválido\n");
    }else if (a == b && a == c && b == c){
        printf("Triângulo equilátero\n");
    }else if(a != b && a != c && b != c){
        printf("Triângulo escaleno\n");
    }else if (a == b || b == c || c == a) {
        printf("Triângulo isósceles\n");
    }
    return 0;
}