<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ClasesJava.*"%>
<!DOCTYPE html>
<!-- comprueba la existencia del cliente introducido y si existe se pide el 
articulo a comprar-->
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
            boolean existe= true;
            HttpSession sesion = request.getSession();
            Cliente c = (Cliente) sesion.getAttribute("Cliente");
            
            /*Si el codigo del cliente esta vacío quiere decir que es la primera
            vez que se ejecuta esta página para un determinado cliente. Si no lo 
            está no lo busca en la base de datos*/
            try{
            if(c.getCodigo()==""){
                GestionClientes gestC = new GestionClientes();
                c = gestC.BuscarClientePorCodigo(request.getParameter("codigoCl"));
                if(c==null){ 
                    String codigoSinCeros = request.getParameter("codigoCl");
                    for(int i=0; codigoSinCeros.length()<6; i++){
                                codigoSinCeros = "0" + codigoSinCeros;
                    }%>
                
        <h2>Cliente con c&oacute;digo: <%= codigoSinCeros%>, no existe</h2>
                    
        <%
                    existe=false;
                }
            }
            
            if(existe==true){ %>
                <body onload="document.formPedidos.codigoArt.focus()">   
                <%
                  sesion.setAttribute("Cliente", c);
                  //se guarda el cliente para no tener que volver a buscarlo cada vez.
                %>
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
                
                <h2>Realizar Pedido:</h2>
                Art&iacute;culo<br>
                <form name="formPedidos" action="PedidosBuscarArticulo.jsp"
                    method="post" onsubmit="return TodoCorrecto_submit()">
                    <input type="hidden" name="opcion" 
                           value="<%=request.getParameter("opcion")%>"/> 
                    <input type="text" name="codigoArt" size="4" maxlength="6"/>
                    <br><br>
                    <input type="submit" value="Aceptar">
                    <input type="reset" value="Cancelar" 
                           onclick="document.formPedidos.codigoArt.focus()">
                </form>
            <%   }  
               }catch(Exception e){ e.printStackTrace(); }%>
            <br>
            <a href="PedCodCli.jsp">Nuevo Cliente</a>
            <a href="index.jsp">P&aacute;gina principal</a>
            
            <script language="JavaScript" type="text/javascript">
                function TodoCorrecto_submit(){
                    with(document.formPedidos.codigoArt){
                        if(value==""){
                            alert("No se ha introducido ningún artículo");
                            focus();
                            return false;
                        }else{
                            for(i=0; value.length<6; i++){
                                value = "0"+value;
                            }
                            
                            return true;
                        }   
                    }
                }
            </script>
    </body>
</html>
