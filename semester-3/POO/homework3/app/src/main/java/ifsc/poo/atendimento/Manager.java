package ifsc.poo.atendimento;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public class Manager {
    static Queue<Client> fila = new LinkedList<>(); //fila real que será atendida e terá remoção de clientes
    static List<Client> atendidos = new ArrayList<>();//Lista de clientes atendidos
    static List<Client> registrados = new LinkedList<>(); //fila de todos os clientes ja registrados

    //Registrar novas solicitações de atendimento, vinculadas ao nome e telefone do cliente.
    static void addClient(Client client){
        registrados.add(client);
        fila.add(client);
    }

    //Listar os telefones de todos os clientes já registrados.
    static void getPhonesRegistred(){

        if(!registrados.isEmpty()){
            System.out.println("{Telefones de todos os clientes registrados}");
            for(Client C : registrados){
            System.out.println("Client{" + "nome=" + C.getName() + ",telefone=" + C.getPhone() + "}");
        }
        }else{
            System.out.println("Fila vazia!");
        }
        
    }

    //Imprimir o nome do próximo cliente da fila.
    static void getNexClient(){
        if(!fila.isEmpty()){
            Client C = fila.peek();
            System.out.println("Próximo cliente da fila: " + C.getName());
        }else{
            System.out.println("Fila vazia!");
        }
    }

    //Atender o próximo cliente da fila.
    static void toMeetNextClient(){
        if(!fila.isEmpty()){
            Client C = fila.poll();
            System.out.println("Atendendo o próximo cliente da fila: " + C.getName());
            atendidos.add(C);

        }else{
            System.out.println("Fila vazia!");
        }
    }

    //Listar os nomes dos clientes já atendidos.
    static void getNameClientsServed(){
        if(!registrados.isEmpty()){
            System.out.println("{Nome de todos os clientes atendidos}");
            for(Client C : atendidos){
            System.out.println("Client{" + "nome=" + C.getName() + "}");
        }
        }else{
            System.out.println("Fila vazia!");
        }
    }


    static void getPhonesWait(){
        if(!fila.isEmpty()){
            System.out.println("{Telefones de todos os clientes em espera}");
            for(Client C : fila){
                System.out.println("Client{" + "nome=" + C.getName() + ",telefone=" + C.getPhone() + "}");
        }
        }else{
            System.out.println("Nenhum cliente em espera!");
        }
    }

    static void getReport(){
        System.out.println("Solicitações registradas: " + registrados.size() + "\nClientes atendidos: " + atendidos.size() + "\nClientes em espera: " + fila.size());
        long qtdSolicitationsSup = registrados.stream().filter(cliente -> cliente.getSolicitation().stream().anyMatch(s -> s.getCategory().equals("Suporte Técnico"))).count();
        long qtdSolicitationsInfo = registrados.stream().filter(cliente -> cliente.getSolicitation().stream().anyMatch(s -> s.getCategory().equals("Informação"))).count();
        long qtdSolicitationsFinan  = registrados.stream().filter(cliente -> cliente.getSolicitation().stream().anyMatch(s -> s.getCategory().equals("Atendimento Financeiro"))).count();

        System.out.println("Categoria: Suporte Técnico        |  Percentual: " + (qtdSolicitationsSup * 100)/registrados.size() + "%");
        System.out.println("Categoria: Informação             |  Percentual: " + (qtdSolicitationsInfo * 100)/registrados.size() + "%");
        System.out.println("Categoria: Atendimento Financeiro |  Percentual: " + (qtdSolicitationsFinan * 100)/registrados.size() + "%");

    }

}
