#include <stdio.h>

int main (){
    
    int segundos, minuto, hora;

    printf("Entre com a quantidade de segundos: ");
    scanf("%d", &segundos);

    if (segundos < 60){
        printf("%d %s\n",segundos, segundos == 1 ? "segundo" : "segundos");
        
    }else{
        minuto = segundos / 60; 

        if (minuto >= 60) { 
            minuto = segundos / 60; 
            segundos = segundos % 60;
            hora = minuto / 60;
            minuto = minuto % 60; 

            if (minuto == 0 && segundos == 0 ) {
                printf("%d %s\n", hora, hora == 1 ? "hora" : "horas");
            }else if (segundos == 0) {
                 printf("%d %s, %d %s\n", hora, hora == 1 ? "hora" : "horas", minuto, minuto == 1 ? "minuto" : "minutos");
            }else if (minuto == 0) {
                printf("%d %s, %d %s\n", hora, hora == 1 ? "hora" : "horas", segundos, segundos == 1 ? "segundo" : "segundos");
            }else{
                 printf("%d %s, %d %s, %d %s\n", hora, hora == 1 ? "hora" : "horas", minuto, minuto == 1 ? "minuto" : "minutos", segundos, segundos == 1 ? "segundo" : "segundos");
            }
        }else {
            segundos = segundos % 60; 
             if (segundos == 0) { // Imprimindo apenas os minutos caso segundos for igual a 0.
            printf("%d %s\n", minuto, minuto == 1 ? "minuto" : "minutos");
        }else{ // Imprimindo os minutos e segundos, caso os segundos não forem igual a 0.
            printf("%d %s, %d %s\n", minuto, minuto == 1 ? "minuto" : "minutos", segundos, segundos == 1 ? "segundo" : "segundos");
        }
        }
       }

    return 0;
}