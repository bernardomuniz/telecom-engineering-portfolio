#include <stdio.h>

int main(){
    int n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, p1, p2, digito_verificador;

    printf("Entre com a primeira parte (1 dígito): ");
    scanf("%d", &n1);
    printf("Entre com a segunda parte (6 dígitos): ");
    scanf("%1d%1d%1d%1d%1d%1d", &n2,&n3,&n4,&n5,&n6,&n7);
    printf("Entre com a terceira parte, sem o dígito verificador (5 dígitos): ");
    scanf("%1d%1d%1d%1d%1d", &n8,&n9,&n10,&n11,&n12);
    
    p1 = n1 + n3 + n5 + n7 + n9 + n11;
    p2 = n2 + n4 + n6 + n8 + n10 + n12;
    digito_verificador = (p2 * 3) + p1;
    digito_verificador = digito_verificador - 1;
    digito_verificador = digito_verificador % 10;
    digito_verificador = 9 - digito_verificador;

    printf("Dígito verificador: %d\n", digito_verificador);
    
    return 0;
}