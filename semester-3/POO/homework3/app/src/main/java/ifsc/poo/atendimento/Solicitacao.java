package ifsc.poo.atendimento;

public class Solicitacao {
    private String description, category;

    public Solicitacao(String description, String category) {
        setCategory(category);
        setDescription(description);
    }

    private boolean setDescription(String description){
        if(description.equals("") || description.isEmpty()){
         System.out.println("Descrição inválida");
         return false;
     }
     this.description = description;
     return true;
    }

    private boolean setCategory(String category) {
        return switch (category) {
            case "Suporte Técnico", "Informação", "Atendimento Financeiro" -> {
                this.category = category;
                yield true;
            }
            default -> {
                System.out.println("Categoria inválida!");
                yield false;
            }
        };
    }

    public String getdescription(){
        return this.description;
    }

    public String getCategory(){
        return this.category;
    }

}
