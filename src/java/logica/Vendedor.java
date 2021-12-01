package logica;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import persistencia.ConexionBD;
/**
 *
 * @author Usuario
 */
public class Vendedor {
    private int idVendedor;
    private String nombre;
    private String telefono;
    private String usuario;
    private String contrasenna;

    public Vendedor() {
    }

    public Vendedor(int idVendedor) {
        this.idVendedor = idVendedor;
    }  

    public Vendedor(String usuario, String contrasenna) {
        this.usuario = usuario;
        this.contrasenna = contrasenna;
    }    
    
    public Vendedor(int idVendedor, String nombre, String telefono) {
        this.idVendedor = idVendedor;
        this.nombre = nombre;
        this.telefono = telefono;
    }

    public Vendedor(int idVendedor, String nombre, String telefono, String usuario, String contrasenna) {
        this.idVendedor = idVendedor;
        this.nombre = nombre;
        this.telefono = telefono;
        this.usuario = usuario;
        this.contrasenna = contrasenna;
    }   

    public int getIdVendedor() {
        return idVendedor;
    }

    public void setIdVendedor(int idVendedor) {
        this.idVendedor = idVendedor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasenna() {
        return contrasenna;
    }

    public void setContrasenna(String contrasenna) {
        this.contrasenna = contrasenna;
    }

    @Override
    public String toString() {
        return "Vendedor{" + "idVendedor=" + idVendedor + ", nombre=" + nombre + ", telefono=" + telefono + ", usuario=" + usuario + ", contrasenna=" + contrasenna + '}';
    }
    
    public Vendedor validarUsuario(){
        ConexionBD conexion = new ConexionBD();
        String sql="SELECT usuario FROM vendedores WHERE usuario='"+this.usuario
                +"' AND contrasenna='"+this.contrasenna+"'";
        ResultSet rs= conexion.consultarBD(sql);
        try{
            if(rs.next()){
                this.contrasenna="";
            }else{
                return null;
            }
        }catch (SQLException ex) {
            System.out.println("Error: "+ex.getMessage());
        }finally{
            conexion.cerrarConexion();
        }
        return this;
    }
    
    public List<Vendedor> consultarVendedores() {
        List<Vendedor> listarVendedores = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM vendedores";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Vendedor ven;
            while (rs.next()) {
                ven = new Vendedor();
                ven.setIdVendedor(rs.getInt("idVendedor"));
                ven.setNombre(rs.getString("nombre"));                
                ven.setTelefono(rs.getString("telefono"));              
                ven.setUsuario(rs.getString("usuario"));              
                ven.setContrasenna(rs.getString("contrasenna"));              
                listarVendedores.add(ven);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listarVendedores;
    }

    public Vendedor consultarVendedor() {
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM vendedores WHERE idVendedor=" + this.idVendedor + ";";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            if (rs.next()) {
                this.nombre = rs.getString("nombre");                
                this.telefono = rs.getString("telefono");                
                this.usuario = rs.getString("usuario");                
                this.contrasenna = rs.getString("contrasenna");                
            } else {
                return null;
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return this;
    }

    public boolean guardarVendedor() {
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO vendedores\n"
                + "(nombre, telefono, usuario, contrasenna)\n"
                + "VALUES('" + this.nombre + "', '" + this.telefono + "', '" + this.usuario + "', '" + this.contrasenna + "');";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.insertarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public boolean actualizarVendedor() {
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE vendedores\n"
                + "SET nombre='" + this.nombre + "', telefono='" + this.telefono + "', usuario='" + this.usuario + "', contrasenna='" + this.contrasenna + "'\n"
                + "WHERE idVendedor=" + this.idVendedor + ";";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }

    public boolean eliminarVendedor() {
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM vendedores WHERE idVendedor=" + this.idVendedor + ";";
        if (conexion.setAutoCommitBD(false)) {
            if (conexion.actualizarBD(sql)) {
                conexion.commitBD();
                conexion.cerrarConexion();
                return true;
            } else {
                conexion.rollbackBD();
                conexion.cerrarConexion();
                return false;
            }
        } else {
            conexion.cerrarConexion();
            return false;
        }
    }
}
