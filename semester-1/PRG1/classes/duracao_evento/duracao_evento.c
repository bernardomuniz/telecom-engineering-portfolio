#include <stdio.h>

typedef struct{
    
    int minuto, hora;

}Horario;

typedef struct{
    
    Horario inicio, fim;

}Evento;

int converter_para_minutos(Horario horario){
    int minutos;
    minutos = horario.hora * 60 + horario.minuto;
    return minutos;
};

Horario converter_para_horario(int minutos){
    Horario horario;
    horario.hora = minutos / 60;
    horario.minuto = minutos %60;
    return horario;
};

Horario duracao_evento(Evento evento){
   Horario duracao;
   int delta; 
   delta = converter_para_minutos(evento.fim) - converter_para_minutos(evento.inicio);
   if (delta <= 0) {
    delta += 24 * 60;
   }
   duracao = converter_para_horario(delta);

   return duracao; 
}

int main(void){
    Evento evento;
    Horario duracao;
    printf("Entre com o horário de início (HH:MM): ");
    scanf("%d:%d", &evento.inicio.hora, &evento.inicio.minuto );

    printf("Entre com o horário de término (HH:MM): ");
    scanf("%d:%d", &evento.fim.hora, &evento.fim.minuto);

    duracao = duracao_evento(evento);
    printf("Duração do evento: %02d:%02d\n", duracao.hora, duracao.minuto);

    return 0;
}