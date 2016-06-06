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
public class clientes {
    String cliente_documento_cliente, nombre;
    int valor;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
    public String getCliente_documento_cliente() {
        return cliente_documento_cliente;
    }

    public void setCliente_documento_cliente(String cliente_documento_cliente) {
        this.cliente_documento_cliente = cliente_documento_cliente;
    }


    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }
    
    
}
