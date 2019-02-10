<%@page import="java.util.Vector"%>
<%@page import="ClasesJava.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gesti&oacute;n de pedidos</title>
    </head>
    <body>
        <%
            HttpSession sesion=request.getSession();            
            Vector vPedidos=(Vector)sesion.getAttribute("Pedidos");
            Cliente c=(Cliente) sesion.getAttribute("Cliente");
            Pedidos pedido=new Pedidos(); 
            
            java.sql.Date fechaSistema=new java.sql.Date
                                        ((new java.util.Date()).getTime());
            String fecha=String.valueOf(fechaSistema);
            String fecha1=fecha.substring(8,10);
            fecha1 = fecha1 + fecha.substring(4,7);
            fecha1 = fecha1 + "-" + fecha.substring(0,4);
            Integer numFactura=(Integer) sesion.getAttribute("numFactura");
            int i=0;
            int numLinea=571;
            float total=0;
            float importe=0;
            
            while (i < vPedidos.size()) {
                pedido = (Pedidos) vPedidos.elementAt(i);
                // Imprimo las cabeceras.
                if (numLinea > 570) {
                    /* La página se escribe en el pie de página. Por lo tanto,
                    si es la primera página, el número de página no se
                    escribe. */
                    numLinea = 30;
            }
        %>
        <hr>
        Fecha:  <%= fecha1%>
        <br>
        FACTURA N.: <%= numFactura%>
        <br>
        <hr>
        <center>
            <h2>Empresa Proyecto Web de clase, S.A.</h2>
            <h3>N.I.F.: 28938475-J</h3
            <h4>C/ Isla de S&aacute;lvora, 451 - 28400 Collado Villalba - Madrid</h4>
        </center>
        <hr>
        <b>Cliente: </b><%= c.getCodigo()%> 
        <b>   N.I.F.: </b><%= c.getNif()%><br>
        <b>D./D&ntilde;a. </b><%= c.getNombre()%> <%= c.getApellidos()%><br>
        <%= c.getDomicilio()%><br>
        <%= c.getCodigo_postal()%> <%= c.getLocalidad()%>
        <hr>
        <table align=center>
            <tr>
                <td><h3>C&oacute;digo</h3></td>
                <td><h3>Descripci&oacute;n</h3></td>
                <td><h3>Precio</h3></td>
                <td><h3>Unidades</h3></td>
                <td><h3>Importe</h3></td>
            </tr>
            
            <% }%>
            <tr>
                <td><%= pedido.getArticulo()%></td>
                <td><%= pedido.getDescripcion()%></td>
                <td align=right><%= String.valueOf(pedido.getPrecio())%></td>
                <td align=right><%= String.valueOf(pedido.getUnidades())%></td>
                <td align=right><%= String.valueOf(pedido.getImporte())%></td>
            </tr>
            <%
                    total = total + pedido.getImporte();
                    i++;
                }
            %>
        </table>
        <hr>
        <h2 align=right>Total Factura (I.V.A. inc.): <%= String.valueOf(total) %>
        </h2>
        <hr>
    </body>
</html>
