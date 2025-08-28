package ifsc.poo.login;

public class User {
    private String login, senha;
    
    public User(String login, String senha) {
        setLogin(login);
        setSenha(senha);
    }

    private boolean setLogin(String login){

        //Para o caso do usuario não entrar com um login
        if(login.isEmpty()){
            System.out.println("Usuário inválido!");
            return false;
        }
        this.login = login;
        return true;
    }

    private boolean  setSenha(String senha){
        if(senha.isEmpty()){
             System.out.println("Senha inválida!");
            return false;
        }
        this.senha = senha;
        return true;
    }

    public String getSenha(){
        return this.senha;
    }

    public String getLogin(){
        return this.login;
    }



}
