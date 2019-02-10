<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ClasesJava.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Gesti&oacute;n de pedidos</title>
        <style type="text/css">
          a {font-size:18px; 
          color:#5dc0a6;}
          body {font-family:  Consolas, monaco, monospace;}
        </style>
    </head>
    <body>
        <h1>Gesti&oacute;n de pedidos</h1>
        <%
            HttpSession s =  request.getSession();
            Cliente c = (Cliente) s.getAttribute("Cliente");
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
        <%
            HttpSession sesion = request.getSession();
            Vector pedidos = (Vector) sesion.getAttribute("Pedidos");
            
                Pedidos pedido = new Pedidos("", "",0, 0,0);
                pedido.setArticulo(request.getParameter("codigoArt"));
                pedido.setDescripcion(request.getParameter("txtDescripcion"));
                Float precio = new Float(request.getParameter("txtPrecio"));
                pedido.setPrecio(precio.floatValue());
                Float unidades = new Float(request.getParameter("txtUnidades"));
                pedido.setUnidades(unidades.floatValue());
                Float importe = new Float(request.getParameter("txtImporte"));
                pedido.setImporte(importe.floatValue());
                
            pedidos.addElement(pedido);
            sesion.setAttribute("Pedidos", pedidos);
        %>
        
        <h2>Pedido Realizado</h2>
        <table>
            <tr>
                <td><b>Art&iacute;culo</b></td>
                <td><b>&nbsp;&nbsp;&nbsp;Descripci&oacute;n</b></td>
                <td><b>&nbsp;&nbsp;&nbsp;Unidades</b></td>
                <td><b>&nbsp;&nbsp;&nbsp;Precio</b></td>
                <td><b>&nbsp;&nbsp;&nbsp;Importe</b></td>
            </tr>
            <%
                pedidos = (Vector) sesion.getAttribute("Pedidos");
                int i = 0;
                float total = 0;
                while (i < pedidos.size()) {
                    pedido=(Pedidos)pedidos.elementAt(i);
                
            %>
            <tr>
                <td><%= pedido.getArticulo()%></td>
                <td align="left">&nbsp;&nbsp;&nbsp;
                    <%= pedido.getDescripcion()%>
                </td>
                <td align="right">&nbsp;&nbsp;&nbsp;
                    <%= pedido.getUnidades()%>
                </td>
                <td align="right">&nbsp;&nbsp;&nbsp;
                    <%= pedido.getPrecio()%>
                </td>
                <td align="right">&nbsp;&nbsp;&nbsp;
                    <%= pedido.getImporte()%>
                </td>
            </tr>
            <%
                    total = total + pedido.getImporte();
                    i++;
                }
            %>
        </table>
        <br>
        <h2>Importe del pedido: <%= total %></h2>
        <hr>
        <br>
        <form name="formPedidos" action="Factura.jsp" method="get">
            <input type=hidden name=opcion 
                value="<%= request.getParameter("opcion") %>">
            <input type="submit" name="cmdAceptar" value="Aceptar pedido">
        </form>
        <br>
        <a href="PedidosBuscarCliente.jsp?opcion=
           <%=request.getParameter("opcion")%>&txtCodigo=
           <%= request.getParameter("txtCodigo")%>">Pedir otro art&iacute;culo</a>
        | <a href="index.jsp">P&aacute;gina principal</a>   
    </body>
</html>
