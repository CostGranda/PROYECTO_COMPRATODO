/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class registro {

    private int codigo_venta;
    private String fecha_venta;
    private int valor_total;
    private String VENDEDOR_documento;
    private String CLIENTE_documento_cliente;

    static private String classfor = "oracle.jdbc.OracleDriver";
    static private String url = "jdbc:oracle:thin:@localhost:1521:XE";
    static private String usuario = "us_compratodo";
    static private String clave = "123456";

    //private Connection con = null;
    private PreparedStatement pr = null;
    private ResultSet rs = null;
    private static Connection con;

    public void insertar(int codigo_venta, String fecha_venta, int valor_total, String VENDEDOR_documento,
            String CLIENTE_documento_cliente) {
        Statement st;
        try {
            String sql = "INSERT INTO VENTA values (" + codigo_venta + ",to_date('" + fecha_venta + "','YYYY-MM-DD')," + valor_total + "," + VENDEDOR_documento + "," + CLIENTE_documento_cliente + ")";
            //String sql = "INSERT INTO VENTA values (?,?,?,?,?)";
            Class.forName(classfor);
            con = DriverManager.getConnection(url, usuario, clave);
            st = con.createStatement();
            st.executeUpdate(sql);

            /*            pr = con.prepareStatement(sql);
            pr.setInt(1, codigo_venta);
            pr.setString(2, "'16/04/2016'");
            pr.setInt(3, valor_total);
            pr.setString(4, VENDEDOR_documento);
            pr.setString(5, CLIENTE_documento_cliente);
            pr.executeUpdate();
            pr.close();*/
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public void actualizar(int codigo_venta, String fecha_venta, int valor_total,
            String VENDEDOR_documento, String CLIENTE_documento_cliente) {
        String sql = "UPDATE VENTA SET fecha_venta=to_date('" + fecha_venta + "','YYYY-MM-DD'), "
                + "valor_total=" + valor_total + ", VENDEDOR_DOCUMENTO = " + VENDEDOR_documento + ", "
                + "CLIENTE_documento_cliente='" + CLIENTE_documento_cliente + "' WHERE codigo_venta = " + codigo_venta + "";
        Statement st;
        try {
            Class.forName(classfor);
            con = DriverManager.getConnection(url, usuario, clave);
            st = con.createStatement();
            st.executeUpdate(sql);
            st.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Vector<registro> buscar() {
        Vector<registro> vecPro = new Vector<registro>();
        String sql = "SELECT * FROM VENTA";
        try {
            Statement st;
            Class.forName(classfor);
            con = DriverManager.getConnection(url, usuario, clave);
            st = con.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                registro pro = new registro();
                pro.setCodigo_venta(rs.getInt("codigo_venta"));
                pro.setFecha_venta(rs.getString("fecha_venta").substring(0, 10));
                pro.setValor_total(rs.getInt("valor_total"));
                pro.setVENDEDOR_documento(rs.getString("VENDEDOR_documento"));
                pro.setCLIENTE_documento_cliente(rs.getString("CLIENTE_documento_cliente"));
                vecPro.add(pro);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                rs.close();
                pr.close();
                con.close();
            } catch (Exception ex) {

            }
        }
        return vecPro;
    }

    public void eliminar(int codigo_venta) {
        String sql = "DELETE FROM VENTA WHERE codigo_venta = " + codigo_venta + "";
        String sql2 = "DELETE FROM producto_venta where VENTA_codigo_venta = " + codigo_venta;
        try {
            Class.forName(classfor);
            con = DriverManager.getConnection(url, usuario, clave);
            Statement st = con.createStatement();
            st.executeUpdate(sql2);
            st = con.createStatement();
            st.executeUpdate(sql);
            st.close();

        } catch (Exception ev) {
            System.out.println("No se pudo eliminar el dato");
        }
    }

    public int getCodigo_venta() {
        return codigo_venta;
    }

    public void setCodigo_venta(int codigo_venta) {
        this.codigo_venta = codigo_venta;
    }

    public String getFecha_venta() {
        return fecha_venta;
    }

    public void setFecha_venta(String fecha_venta) {
        this.fecha_venta = fecha_venta;
    }

    public int getValor_total() {
        return valor_total;
    }

    public void setValor_total(int valor_total) {
        this.valor_total = valor_total;
    }

    public String getVENDEDOR_documento() {
        return VENDEDOR_documento;
    }

    public void setVENDEDOR_documento(String VENDEDOR_documento) {
        this.VENDEDOR_documento = VENDEDOR_documento;
    }

    public String getCLIENTE_documento_cliente() {
        return CLIENTE_documento_cliente;
    }

    public void setCLIENTE_documento_cliente(String CLIENTE_documento_cliente) {
        this.CLIENTE_documento_cliente = CLIENTE_documento_cliente;
    }

}
