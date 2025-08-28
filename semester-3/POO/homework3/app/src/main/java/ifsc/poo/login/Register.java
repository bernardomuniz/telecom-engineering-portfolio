package ifsc.poo.login;

import java.util.LinkedHashSet;
import java.util.Set;

public class Register {
    public static  Set<User> users = new LinkedHashSet<>();

    //Cadastra novos usuários a partir do login e senha, garantindo que logins não se repitam
    static void addUser(User usuario){

        boolean existe = users.stream().anyMatch(u->u.getLogin().equalsIgnoreCase(usuario.getLogin()));

        if(!existe){
            users.add(usuario);
            System.out.println("Usuário " + usuario.getLogin() + " criado com sucesso!");
        }else{
            System.out.println("Ja existe um usuário com este login!");
        }
    }
    
    //Remove usuários com base em seu login
    static  void removeUser(String login){
        if(users.removeIf(u-> u.getLogin().equals(login)))
        {
            System.out.println("Usuário " + login + " removido com sucesso!");
        }else{
             System.out.println("Usuário inválido ou inexistente!");
        }
       
    }

    //Autentica usuários
    static void autenticationUser(String login, String senha){
        User alvo = users.stream()
                         .filter(u -> u.getLogin().equals(login) && u.getSenha().equals(senha))
                         .findFirst()
                         .orElse(null);
        if(alvo != null){
            System.out.println("Usuário " + login + " autenticado com sucesso!");
        }else{
              System.out.println("Usuário ou senha inválidos!");
        }
    }
    
    static void getUsers(){

        if(!users.isEmpty()){
              for(User u : users){
            System.out.println("Usuário{" + "login=" + u.getLogin() + "}");
        }
        }else{
            System.out.println("Nenhum usuário cadastrado!");
        }
    }

}
