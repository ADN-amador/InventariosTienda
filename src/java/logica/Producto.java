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
public class Producto {

    private int idProducto;
    private String nombre;
    private String descripcion;
    private int precio;
    private int stock;

    public Producto() {
    }

    public Producto(int idProducto) {
        this.idProducto = idProducto;
    }

    public Producto(int idProducto, String nombre, String descripcion, int precio, int stock) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.stock = stock;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    @Override
    public String toString() {
        return "Producto{" + "idProducto=" + idProducto + ", nombre=" + nombre + ", descripcion=" + descripcion + ", precio=" + precio + ", stock=" + stock + '}';
    }

    public List<Producto> consultarProductos() {
        List<Producto> listarProductos = new ArrayList<>();
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM productos";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            Producto pro;
            while (rs.next()) {
                pro = new Producto();
                pro.setIdProducto(rs.getInt("idProducto"));
                pro.setNombre(rs.getString("nombre"));
                pro.setDescripcion(rs.getString("descripcion"));
                pro.setPrecio(rs.getInt("precio"));
                pro.setStock(rs.getInt("stock"));
                listarProductos.add(pro);
            }
        } catch (SQLException ex) {
            System.out.println("Error: " + ex.getMessage());
        } finally {
            conexion.cerrarConexion();
        }
        return listarProductos;
    }

    public Producto consultarProducto() {
        ConexionBD conexion = new ConexionBD();
        String sql = "SELECT * FROM productos WHERE idProducto=" + this.idProducto + ";";
        ResultSet rs = conexion.consultarBD(sql);
        try {
            if (rs.next()) {
                this.nombre = rs.getString("nombre");
                this.descripcion = rs.getString("descripcion");
                this.precio = rs.getInt("precio");
                this.stock = rs.getInt("stock");
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

    public boolean guardarProducto() {
        ConexionBD conexion = new ConexionBD();
        String sql = "INSERT INTO productos\n"
                + "(nombre, descripcion, precio, stock)\n"
                + "VALUES('" + this.nombre + "', '" + this.descripcion + "', " + this.precio + ", " + this.stock + ");";
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

    public boolean actualizarProducto() {
        ConexionBD conexion = new ConexionBD();
        String sql = "UPDATE productos\n"
                + "SET nombre='" + this.nombre + "', descripcion='" + this.descripcion + "', precio=" + this.precio + ", stock=" + this.stock + "\n"
                + "WHERE idProducto=" + this.idProducto + ";";
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

    public boolean eliminarProducto() {
        ConexionBD conexion = new ConexionBD();
        String sql = "DELETE FROM productos WHERE idProducto=" + this.idProducto + ";";
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
