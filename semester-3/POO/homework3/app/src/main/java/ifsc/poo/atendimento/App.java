package ifsc.poo.atendimento;

public class App {

    public static void main(String[] args) {
        Manager.addClient(new Client("Sérgio Prolo", "997812649", new Solicitacao("Preciso de suporte técnico", "Suporte Técnico")));
        Manager.addClient(new Client("Mariana", "982345678", new Solicitacao("Quero saber sobre minha fatura", "Atendimento Financeiro")));
        Manager.addClient(new Client("Lucas", "997812345", new Solicitacao("Meu serviço está fora do ar", "Suporte Técnico")));
        Manager.addClient(new Client("Fernanda", "996789321", new Solicitacao("Como faço para alterar meu plano?", "Informação")));
        Manager.addClient(new Client("João", "995432198", new Solicitacao("Tenho dúvidas sobre cobranças", "Atendimento Financeiro")));
        Client bernardo = new Client("Bernardo", "991061141", new Solicitacao("Preciso de suporte técnico", "Suporte Técnico"));
        Manager.addClient(bernardo);
        System.out.println("\n");
        bernardo.newSolicitation(new Solicitacao("Quero alterar meu plano", "Suporte Técnico"));

        System.out.println("\n");
        Manager.getPhonesRegistred();
        System.out.println("\n");
        System.out.println("\nAtendendo os três próximos clientes da fila...");
        Manager.getNexClient();
        Manager.toMeetNextClient();
        Manager.getNexClient();
        Manager.toMeetNextClient();
        Manager.getNexClient();
        Manager.toMeetNextClient();
        System.out.println("\n");
        Manager.getNameClientsServed();
        System.out.println("\n");
        Manager.getPhonesWait();
        System.out.println("\n");
        Manager.getReport();
       
    }
  
}
