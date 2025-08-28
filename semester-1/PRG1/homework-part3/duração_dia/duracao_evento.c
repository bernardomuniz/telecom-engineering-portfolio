#include <stdio.h>

typedef struct{
    int horas, minutos;
} Horario;

typedef struct{
    Horario inicio, termino;
} Evento;

int converter_para_minutos(Horario horario){
    int minutos;
    minutos = horario.horas * 60 + horario.minutos;
    return minutos;
}

Horario converter_para_horario(int minutos){
    Horario horario;

    horario.horas = minutos / 60;
    horario.minutos = minutos % 60;

    return horario;
}

Horario duracao_evento(Evento evento){
    Horario duracao;
    int delta;

    delta = converter_para_minutos(evento.termino) - converter_para_minutos(evento.inicio);

    if (delta < 0) {
        delta += 24 * 60;
    }

    duracao = converter_para_horario(delta);
    return duracao;
}
int main(){
    Evento evento;
    Horario duracao;

    printf("Entre com o horário de início (HH:MM): ");
    scanf("%d:%d", &evento.inicio.horas, &evento.inicio.minutos);
    printf("Entre com o horário de término (HH:MM): ");
    scanf("%d:%d", &evento.termino.horas, &evento.termino.minutos);

    duracao = duracao_evento(evento);
    printf("Duração do evento: %02d:%02d\n", duracao.horas, duracao.minutos);

    return 0;
}