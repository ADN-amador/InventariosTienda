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
public class Cliente {
    private int idCliente;
    private String nombre;
    private String direccion;
    private String telefono;

    public Cliente() {
    }

    public Cliente(int idCliente) {
        this.idCliente = idCliente;
    }       

    public Cliente(int idCliente, String nombre, String direccion, String telefono) {
        this.idCliente = idCliente;
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    @Override
    public String toString() {
        return "Cliente{" + "idCliente=" + idCliente + ", nombre=" + nombre + ", direccion=" + direccion + ", telefono=" + telefono + '}';
    }
    
    public List<Cliente> consultarClientes() {
        List<Cliente> listarClientes = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM clientes";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Cliente cli;
            while (rs.next()) {
                cli = new Cliente();
                cli.setIdCliente(rs.getInt("idCliente"));
                cli.setNombre(rs.getString("nombre"));
                cli.setDireccion(rs.getString("direccion"));
                cli.setTelefono(rs.getString("telefono"));              
                listarClientes.add(cli);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listarClientes;
    }

    public Cliente consultarCliente() {
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM clientes WHERE idCliente=" + this.idCliente + ";";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            if (rs.next()) {
                this.nombre = rs.getString("nombre");
                this.direccion = rs.getString("direccion");
                this.telefono = rs.getString("telefono");                
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

    public boolean guardarCliente() {
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO clientes\n"
                + "(nombre, direccion, telefono)\n"
                + "VALUES('" + this.nombre + "', '" + this.direccion + "', " + this.telefono + ");";
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

    public boolean actualizarCliente() {
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE clientes\n"
                + "SET nombre='" + this.nombre + "', direccion='" + this.direccion + "', telefono=" + this.telefono + "\n"
                + "WHERE idCliente=" + this.idCliente + ";";
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

    public boolean eliminarCliente() {
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM clientes WHERE idCliente=" + this.idCliente + ";";
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
