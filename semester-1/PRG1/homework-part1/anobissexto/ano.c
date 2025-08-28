#include <stdio.h>
#include  <stdbool.h>


int main(){
    bool ano_bissexto;
    int ano;

    printf("Entre com um ano: ");
    scanf("%d", &ano);

  ano_bissexto = ano % 4 == 0 && ano % 100 != 0 || ano % 400 == 0;
    printf("Ano bissexto: %d\n", ano_bissexto);

    return 0;
}