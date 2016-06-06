/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author coste
 */
public class proveedores {
    int proveedor_nit, cantidad;
    String nombre_proveedor;

    public int getProveedor_nit() {
        return proveedor_nit;
    }

    public void setProveedor_nit(int proveedor_nit) {
        this.proveedor_nit = proveedor_nit;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getNombre_proveedor() {
        return nombre_proveedor;
    }

    public void setNombre_proveedor(String nombre_proveedor) {
        this.nombre_proveedor = nombre_proveedor;
    }
    
}
