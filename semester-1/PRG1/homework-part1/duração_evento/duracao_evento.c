#include <stdio.h>

//Parâmetro: Váriaveis locais da função
//Argumentos: Valores que serão passados para a função no lugar dos parâmetros
//Os valores dos argumentos são copiados para os parâmetros.

int converter_para_minutos (int hh, int mm); //Protótipo
void converter_para_hhmm (int minutos, int *hh, int *mm);


//Converte horário para minutos
int converter_para_minutos (int hh, int mm){
    int minutos;
    minutos = (hh * 60) + mm;
    return minutos;
}

void converter_para_hhmm (int minutos, int *hh, int *mm){
    *hh = minutos/ 60;
    *mm = minutos % 60;
}

void duracao_evento (int hh_i, int mm_i, int hh_f, int mm_f, int *hh_d, int *mm_d){
   float minutos_tot_inicio, minutos_tot_final;
   int duracao_minutos;

    minutos_tot_inicio = converter_para_minutos(hh_i, mm_i); //Minutos totais da hora de início
    minutos_tot_final = converter_para_minutos(hh_f, mm_f); //Minutos totais da hora final.

    if (minutos_tot_final < minutos_tot_inicio) {
        minutos_tot_final += 24 * 60;
    }
    

    converter_para_hhmm(duracao_minutos, hh_d, mm_d);
}


int main(){
    int hora_i, minuto_i, hora_f, minuto_f, hora_tot, minuto_tot;

    printf("Entre com o horário de início (HH:MM): ");
    scanf("%d:%d", &hora_i, &minuto_i);
    printf("Entre com o horário de término (HH:MM): ");
    scanf("%d:%d", &hora_f, &minuto_f);

    duracao_evento(hora_i, minuto_i, hora_f, minuto_f, &hora_tot, &minuto_tot);

    printf("Duração do evento: %02d:%02d\n", hora_tot, minuto_tot);

    return 0;
}