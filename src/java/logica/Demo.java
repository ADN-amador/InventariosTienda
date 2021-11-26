package logica;

public class Demo {
    public static void main(String[] args){
        Vendedor v = new Vendedor("admin","123").validarUsuario();
        if(v != null){
            System.out.println(v);
        }else{
            System.out.println(v);
        }
    }
}
