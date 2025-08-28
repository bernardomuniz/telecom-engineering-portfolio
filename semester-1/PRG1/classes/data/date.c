#include <stdio.h>

int main(){
    int dia, mes, ano;
    printf("Entre com a data (dd/mm/aaaa): ");
    scanf("%d/%d/%d", &dia, &mes, &ano);

    switch (mes) {
        case 1:
        printf("January ");
        break;
        case 2:
        printf("February ");
        break;
        case 3:
        printf("March ");
        break;
        case 4:
        printf("April ");
        break;
        case 5:
        printf("May ");
        break;
        case 6:
        printf("June ");
        break;
        case 7:
        printf("July ");
        break;
        case 8:
        printf("August ");
        break;
        case 9:
        printf("September ");
        break;
        case 10:
        printf("October ");
        break;
        case 11:
        printf("November ");
        break;
        case 12:
        printf("December ");
        break;
    }

    if (dia == 1 || dia == 21 || dia == 31){
        printf("%dst, ",dia);
    }else if (dia == 2 || dia == 22) {
        printf("%dnd, ", dia);
    }else if (dia == 3 || dia == 23) {
        printf("%drd, ",dia);
    }else{
         printf("%dth, ",dia);
    }
     printf("%d\n", ano);

    return 0;
}