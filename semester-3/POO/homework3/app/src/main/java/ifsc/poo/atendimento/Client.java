package ifsc.poo.atendimento;

import java.util.LinkedList;
import java.util.List;

public class Client {
    private String name, phone;
    final private List<Solicitacao> solicitation = new LinkedList<>();

    public Client(String name, String phone, Solicitacao solicitacao) {
        setName(name);
        setPhone(phone);
        solicitation.add(solicitacao);
    }

    public void newSolicitation(Solicitacao solicitacao){
        solicitation.add(solicitacao);
        Manager.addClient(this);
        System.out.println("Nova solicitação do cliente " + this.name + " registrada!");
    }

    public List<Solicitacao> getSolicitation(){
        return solicitation;
    }

    private boolean setName(String name){
        if(name.equals("") || name.isEmpty()){
            System.out.println("Nome inválido");
            return false;
        }
        this.name = name;
        return true;
    }

    private boolean setPhone(String phone){
        if(phone.equals("") || phone.isEmpty()){
            System.out.println("Telefone inválido");
            return false;
        }
        this.phone = phone;
        return true;
    }

    public String getPhone(){
        return this.phone;
    }

    public String getName(){
        return this.name;
    }

}
