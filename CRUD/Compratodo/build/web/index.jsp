<%--
    Document   : index
    Created on : 01-jun-2016, 12:53:34
    Author     : sebgv_000
--%>

<%@page import="modelo.registro"%>
<%@page import="modelo.vendedores"%>
<%@page import="modelo.proveedores"%>
<%@page import="modelo.clientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.util.LinkedList"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="stylesheet.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Papeleria Compratodo</title>
    </head>
    <body>

            <form action="ingreso" method="post">
                <table id="ps4">
                    <tr>
                        <td>
                            <table id="ps4">
                                <thead>
                                    <tr>
                                        <th class="tama" colspan="2">Formulario de Ventas</th>
                                    </tr>
                                </thead>
                                <tbody style="font-family:Verdana">
                                    <tr>
                                        <td>
                                            <label>Codigo Venta: </label>
                                        </td>
                                        <td>
                                            <input type="number" min="1521" max="2000" autofocus value="" name="codigo_venta">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Fecha de la Venta:</label>
                                        </td>
                                        <td>
                                            <input type="date"  value="" name="fecha_venta">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Valor Total:</label>
                                        </td>
                                        <td>
                                            <input type="number"  value="" name="valor_total">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="fname">Documento del Vendedor: </label>
                                        </td>
                                        <td>
                                            <input type="text"  value="" name="VENDEDOR_documento"><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="fname">Documento del Cliente: </label>
                                        </td>
                                        <td>
                                            <input type="text"  value="" name="CLIENTE_documento_cliente">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="submit" value="Ingresar" name="ingreso">
                                        </td>
                                        <td>
                                            <input type="submit" value="Actualizar" name="actualizar">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td>
                            <table id="ps4">
                                <thead>
                                    <tr>
                                        <th class="tama" colspan="2">Eliminar una Venta</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td style="font-size:15px; font-family:Verdana">
                                            <label>Codigo Venta:</label>
                                        </td>
                                        <td>
                                            <input type="number" min="1521" max="2000" value="" name="codigo_venta2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input type="submit" value="Borrar" name="borrar">
                                        </td>
                                        <div id="myDiv"></div>

                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td>
                            <table height="420px"id="ps4">
                                <thead>
                                    <tr>
                                        <th class="tama" colspan="2">Consultas:</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                          <select name="um" id="um" class="styled-select">
                                                <option selected value="">[Seleccione una Opción]</option>
                                                <option value="1">Cantidad de Ventas realizas por vendedor</option>
                                                <option value="2">Cantidad de pedidos por proveedor</option>
                                                <option value="3">Valor de todas las compras que haya hecho cada cliente</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table id="1" >
                                              <thead>
                                                <tr id="customers">
                                                  <th>Documento del Vendedor</th>
                                                  <th>Nombre</th>
                                                  <th>Cantidad</th>
                                                </tr>
                                              </thead>
                                                <%
                                                  LinkedList<vendedores> lista = registro.getVendedores();
                                                  for (int i=0;i<lista.size();i++)
                                                  {
                                                    out.println("<tr id="+"customers"+">");
                                                    out.println("<td>"+lista.get(i).getNombre()+"</td>");
                                                    out.println("<td>"+lista.get(i).getVendedor_documento()+"</td>");
                                                    out.println("<td>"+lista.get(i).getCantidad()+"</td>");
                                                    out.println("</tr>");
                                                  }
                                                %>
                                            </table>
                                            <table id="2">
                                              <thead>
                                                <tr id='customers'>
                                                  <th>Nit del Proveedor</th>
                                                  <th>Nombre del Proveedor</th>
                                                  <th>Cantidad</th>
                                                </tr>
                                              </thead>

                                              <%
                                                LinkedList<proveedores> listap = registro.getProveedores();
                                                for (int i=0;i < listap.size();i++)
                                                {
                                                  out.println("<tr id='customers'>");
                                                  out.println("<td>"+listap.get(i).getProveedor_nit()+"</td>");
                                                  out.println("<td>"+listap.get(i).getNombre_proveedor()+"</td>");
                                                  out.println("<td>"+listap.get(i).getCantidad()+"</td>");
                                                  out.println("</tr>");
                                                }
                                              %>
                                            </table>
                                            <table id="3">
                                              <thead>
                                                <tr id='customers'>
                                                  <th>Documento del Cliente</th>
                                                  <th>Nombre del Cliente</th>
                                                  <th>Valor de Compras</th>
                                                </tr>
                                              </thead>
                                              <%
                                                LinkedList<clientes> listac = registro.getClientes();
                                                for (int i=0;i<listac.size();i++)
                                                {
                                                  out.println("<tr id='customers'>");
                                                  out.println("<td>"+listac.get(i).getCliente_documento_cliente()+"</td>");
                                                  out.println("<td>"+listac.get(i).getNombre()+"</td>");
                                                  out.println("<td>"+listac.get(i).getValor()+"</td>");
                                                  out.println("</tr>");
                                                }
                                              %>
                                            </table>
                                            <script type="text/javascript">
                                              var tables = [
                                              document.getElementById('1'),
                                              document.getElementById('2'),
                                              document.getElementById('3')
                                              ];
                                              //Oculta todas las tablas
                                              for (var i in tables) {
                                                tables[i].style.display = "none";
                                              }

                                              document.getElementById('um').onchange = function() {
                                              //Vuelve a ocultar todas las tablas cada que cambia
                                              for (var i in tables) {
                                                tables[i].style.display = "none";
                                              }
                                              // get selected value and show it's table
                                              var selectedValue = this[this.selectedIndex].value;
                                              if (selectedValue) {
                                                document.getElementById(selectedValue).style.display = "block";
                                              }
                                              };
                                            </script>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
            </form>
</div><br><br>
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
