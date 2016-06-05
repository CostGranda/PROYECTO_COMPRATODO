<%--
    Document   : index
    Created on : 01-jun-2016, 12:53:34
    Author     : sebgv_000
--%>

<%@page import="modelo.registro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <link rel="stylesheet" href="stylesheet.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Papeleria Compratodo</title>
    </head>
    <body>

      <div id="d1">
        <form action="ingreso" mehod="post">
            <table  id="t01">
                <tr style="font-weight: bold;">
                    <td colspan="2" aling="center" ><h1>Formulario Ventas</h1> </td>
                </tr>

                <tr>
                  <td>Codigo Venta:</td>
                  <td><input type="number" size="30" value="" name="codigo_venta"></td>
                </tr>
                <tr>
                  <td>Fecha de la Venta:</td>
                  <td><input type="date" size="60" value="" name="fecha_venta"></td>
                </tr>
                <tr>
                  <td>Valor Total:</td>
                  <td><input type="number" value="" name="valor_total"></td>
                </tr>
                <tr>
                  <td>Documento del Vendedor:</td>
                  <td><input type="text" value="" name="VENDEDOR_documento"></td>
                </tr>
                <tr>
                  <td>Documento del Cliente:</td>
                  <td><input type="text" value="" name="CLIENTE_documento_cliente"></td>
                </tr>
                <!-- Botones -->
                <tr aling="left" ><td></td>
                    <td>
                        <input type="submit" value="Ingresar" name="ingreso">
                        <input type="submit" value="Actualizar" name="actualizar">
                        <input type="submit" value="Borrar" name="borrar">
                    </td>
                </tr>
            </table>
        </form>
      </div><br>
      <div>
        <table id="customers">
          <thead>
            <tr>
            <th class="tamanio" colspan="5">REGISTROS DE LA TABLA VENTAS</th>
            </tr>
            <tr>
              <th>Codigo Venta</th>
              <th>Fecha Venta</th>
              <th>Valor Total</th>
              <th>Documento Vendedor</th>
              <th>Documento Cliente</th>
            </tr>
          </thead>
          <tbody>
            <%
              registro pro = new registro();
              for (registro temp : pro.buscar()) {
                %>
                <tr>
                  <td><%= temp.getCodigo_venta()%></td>
                  <td><%= temp.getFecha_venta()%></td>
                  <td><%= temp.getValor_total()%></td>
                  <td><%= temp.getVENDEDOR_documento()%></td>
                  <td><%= temp.getCLIENTE_documento_cliente()%></td>
                </tr>
                <%}%>
          </tbody>
        </table>
      </div>
    </body>
</html>
