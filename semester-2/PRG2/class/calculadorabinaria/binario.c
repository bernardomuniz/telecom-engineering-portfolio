#include <stdio.h>

int AND(int a, int b){
    return a && b;
}

int OR(int a, int b){
    return a || b;
}

int NOT(int a){
    return !(a);
}

int XOR(int a, int b){
    return !(a||b);
}

int main(){
    int a, b, opcao;

    puts("Escolha uma opção para a calculadora binária: ");
    puts("1 - AND");
    puts("2 - OR");
    puts("3 - NOT");
    puts("4 - XOR");
    scanf("%d", &opcao);

    switch (opcao) {
        case 1:
        puts("Entre com dois valores no formato 'a b' sendo 0 ou 1: ");
        scanf("%d %d", &a, &b);
        printf("%d\n", AND(a,b));
        break;
        case 2:
        puts("Entre com dois valores no formato 'a b' sendo 0 ou 1: ");
        scanf("%d %d", &a, &b);
        printf("%d\n", OR(a,b));
        break;
        case 3:
        puts("Entre com um valor no formato 'x' sendo 0 e 1: ");
        scanf("%d", &a);
        printf("%d\n", NOT(a));
        break;
        case 4:
        puts("Entre com dois valores no formato 'a b' sendo 0 ou 1: ");
        scanf("%d %d", &a, &b);
        printf("%d\n", XOR(a,b));
        break;
        default:
        puts("Opção inválida!");
    }
    return 0;
}