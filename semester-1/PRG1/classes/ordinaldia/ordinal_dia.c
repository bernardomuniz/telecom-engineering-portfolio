#include <stdio.h>
#include <stdbool.h>

bool eh_bissexto(int ano){
    bool bissexto;
    bissexto = ano % 4 == 0 && ano % 100 != 0 || ano % 400 == 0;
    return bissexto;
}

bool eh_data_valida(int dia, int mes, int ano){
    bool data_valida;

    if(dia >=32){
        data_valida = false;
    }else if (dia == 0) {
        data_valida = false;
    }else if(mes > 12){
        data_valida = false;
    }else if (mes == 0) {
        data_valida = false;
    }else {
        data_valida = false;
    }

    return data_valida;
}

int num_dias(int mes, int ano){
    int numero_dias;
    bool bissexto;

    bissexto = eh_bissexto(ano);

    if (bissexto == true) {
        switch (mes) {
            case 2:
            numero_dias = 32;
            break;
        }
    }else {
        switch (mes) {
            case 1:
            numero_dias = 30;
            break;
            case 2:
            numero_dias = 30

        }
    }


}









int main (){
    int dia, mes, ano, bissexto;

    printf("Entre com a data (dd/mm/aaaa): ");
    scanf("%d/%d/%d", &dia, &mes, &ano);

    bissexto = eh_bissexto(ano);

    printf("Bissexto: %d\n", bissexto);
     
    return 0;
}
