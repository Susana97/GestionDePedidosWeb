<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ClasesJava.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Gesti&oacute;n de Pedidos</title>
        <style type="text/css">
          a {font-size:18px; 
          color:#5dc0a6;}
          body {font-family:  Consolas, monaco, monospace;}
        </style>
    </head>
    <body>
        <h1>Gesti&oacute;n de Pedidos</h1>
        <%
            GestionArticulos gestArt = new GestionArticulos();
            Articulo a = null;
            a = gestArt.getArticulo(request.getParameter("codigoArt")); 
            
            if(a == null){ //si el objeto es null es que no existe el articulo%>
                <body>
                    <h2>El art&iacute;culo con c&oacute;digo 
                        <%=request.getParameter("codigoArt")%> no existe</h2>
        
            <% }else{ %>
                <body onload="document.formPedidos.txtUnidades.focus()">
                    <!-- muestra los datos del cliente-->
                    <% HttpSession sesion = request.getSession();
                       Cliente c = (Cliente) sesion.getAttribute("Cliente"); %>
                       <h2>Datos del cliente: </h2>
                       <table>
                           <tr>
                               <td><b>C&oacute;digo</b></td>
                               <td><b>&nbsp;&nbsp;&nbsp;N.I.F.</b></td>
                               <td><b>&nbsp;&nbsp;&nbsp;Nombre</b></td>
                               <td><b>&nbsp;&nbsp;&nbsp;Apellidos</b></td>                
                           </tr>
                           <tr>
                               <td><%= c.getCodigo()%></td>
                               <td>&nbsp;&nbsp;&nbsp;<%= c.getNif()%></td>
                               <td>&nbsp;&nbsp;&nbsp;<%= c.getNombre()%></td>
                               <td>&nbsp;&nbsp;&nbsp;<%= c.getApellidos()%></td>
                           </tr>
                       </table>
                       <table>
                           <tr>
                               <td><b>Domicilio</b></td>
                               <td><b>&nbsp;&nbsp;&nbsp;C.P.</b></td>
                               <td><b>&nbsp;&nbsp;&nbsp;Localidad</b></td>
                               <td><b>&nbsp;&nbsp;&nbsp;Total</b></td>
                           </tr>
                           <tr>
                               <td><%= c.getDomicilio()%></td>
                               <td>&nbsp;&nbsp;&nbsp;<%= c.getCodigo_postal()%></td>
                               <td>&nbsp;&nbsp;&nbsp;<%= c.getLocalidad()%></td>
                               <td>&nbsp;&nbsp;&nbsp;<%= c.getTotal_ventas()%></td>
                           </tr>
                       </table>
                       <br/><hr><br>
                       <!-- muestro los datos del articulo -->
                       <h2>Realizar pedido</h2>
                       <form name="formPedidos" action="Pedidos.jsp" method="get"
                             onsubmit="return TodoCorrecto_submit()">
                           <table>
                               <tr>
                                   <td><b>Art&iacute;culo</b></td>
                                   <td><b>&nbsp;&nbsp;&nbsp;Descripci&oacute;n</b></td>
                                   <td><b>&nbsp;&nbsp;&nbsp;Unidades</b></td>
                                   <td><b>&nbsp;&nbsp;&nbsp;Precio</b></td>
                                   <td><b>&nbsp;&nbsp;&nbsp;Importe</b></td>
                               </tr>
                               <tr>
                                   <td><%= request.getParameter("codigoArt")%></td>
                                   <td>&nbsp;&nbsp;&nbsp;<%= a.getDescripcion()%></td>
                                   <td>
                                       &nbsp;&nbsp;
                                       <input type="text" name="txtUnidades" size="9" 
                                              maxlength="9" onkeyup="CalcularPrecio(event)">            
                                   </td>
                                   <td>&nbsp;&nbsp;&nbsp;<%= a.getPrecio()%></td>
                                   <td>
                                       &nbsp;&nbsp;
                                       <input type="text" name="txtImporte" size="9" 
                                              maxlength="9" readonly>                             
                                   </td>
                               </tr>
                           </table> 
                            <input type="hidden" name="codigoArt"
                                   value="<%= request.getParameter("codigoArt")%>">                    
                            <input type="hidden" name="txtDescripcion"
                                   value="<%= a.getDescripcion()%>">
                            <input type="hidden" name="txtPrecio"
                                   value="<%= a.getPrecio()%>">
                            
                            <input type=hidden name=opcion 
                                   value="<%= request.getParameter("opcion")%>">
                            <br><br>
                            <input type="submit" value="Aceptar">
                            <input type="reset" value="Cancelar" 
                                   onclick="document.formPedidos.txtUnidades.focus()">                    
                            <br><br>
                            <hr>
                       </form>
                </body>
            <%} %>
            <a href="PedidosBuscarCliente.jsp?opcion=
               <%=request.getParameter("opcion")%>
               &codigoArt=<%= request.getParameter("codigoArt")%>">
                Nuevo art&iacute;culo</a>|
            <a href="index.jsp">P&aacute;gina principal</a>         
    
    <script language="JavaScript" type="text/javascript">
        
        function CalcularPrecio(event){
            //with(document.formPedidos.txtUnidades){
                if(event.keyCode>57 && event.keyCode<91){
                    alert("Introduzca sólo números.");
                    document.formPedidos.txtUnidades.value="";
                }else{
                    var importe = 0;
                    importe = document.formPedidos.txtUnidades.value * document.formPedidos.txtPrecio.value;
                    document.formPedidos.txtImporte.value = importe;
                }
            //}
        }
        
        function TodoCorrecto_submit() {
            /* Si el usuario pulsa el botón submit sin introducir ningún 
                dato, no se envía nada. */
            with (document.formPedidos.txtUnidades) {               
                if (value==="") {
                    alert("No han introducido las unidades");
                    focus();
                    return false;
                }else{ 
                    return true;
                }
            }
        }     
    </script> 
    </body>
</html>
