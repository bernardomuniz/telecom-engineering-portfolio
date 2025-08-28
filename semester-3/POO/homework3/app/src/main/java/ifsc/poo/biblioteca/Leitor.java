package ifsc.poo.biblioteca;

import java.util.LinkedList;
import java.util.List;

public class Leitor {
    private String nome, endereco, telefone;
    private int id;
    final List<Livro> livros = new LinkedList<>();

    public Leitor(String nome, String endereco, String telefone) {
        setNome(nome);
        setEndereco(endereco);
        setTelefone(telefone);
    }

    private boolean setNome (String nome){
        if(nome.equals("") || nome.isEmpty()){
            System.out.println("Nome inválido!");
            return false;
        }
        this.nome = nome;
        return true;

    }

    public void setId(int id){
        this.id = id;
    }

    private boolean setEndereco (String endereco){
        if(endereco.equals("") || endereco.isEmpty()){
            System.out.println("Endereço inválido!");
            return false;
        }
        this.endereco = endereco;
        return true;
    }

    private boolean setTelefone (String telefone){
        if(telefone.equals("") || telefone.isEmpty()){
            System.out.println("Telefone inválido!");
            return false;
        }
        this.telefone = telefone;
        return true;
    }

    public void setLivros(Livro livro){
        livros.add(livro);
    }

    public String getNome(){
        return this.nome;
    }

    public String getTelefone(){
        return this.telefone;
    }

    public String getEndereco(){
        return this.endereco;
    }

    public int getId(){
        return this.id;
    }

    public List<Livro> getLivros(){
        return livros;
    }
    
}
