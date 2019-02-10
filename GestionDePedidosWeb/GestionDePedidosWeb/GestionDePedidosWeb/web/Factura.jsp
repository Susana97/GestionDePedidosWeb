<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="ClasesJava.*"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Gesti&oacute;n de pedidos<</title>
        <style type="text/css">
          a {font-size:18px; 
          color:#5dc0a6;}
          body {font-family:  Consolas, monaco, monospace;}
          h2#totalFactura {text-align:right; padding-right: 50px;}
          td {padding-right: 20px;}
        </style>
    </head>
    <body>
        <h2>Pedido finalizado</h2>
        Si desea imprimir el pedido se abrir&aacute; una nueva ventana con la 
        factura a imprimir.
        <br>
        En esta ventana, abra el men&uacute; Archivo y ejecute la opci&oacute;n
        Imprimir.
        <br>
        En la nueva ventana, seleccione su impresora y pulse Imprimir.
        <br>
        Despu&eacute;s, cierre la ventana que contiene la factura a imprimir.
        <br>
        Para imprimir el pedido pulse 
        <a href="ImprimirPedido.jsp" target="_blank">aqu&iacute;</a>.
        Si no va a imprimir, puede regresar a la 
        <a href="index.jsp">p&aacute;gina principal.</a>
        <br><br>
        
        <% 
            HttpSession sesion = request.getSession();
            Vector vPedidos = (Vector) sesion.getAttribute("Pedidos");
            Cliente c = (Cliente) sesion.getAttribute("Cliente");
            Pedidos pedido = new Pedidos("","",0,0,0);
            PedidosInternet pedidoInternet = new PedidosInternet("","",0,"");
            Vector vPedidosInternet = new Vector();
            
            java.sql.Date fechaSistema=new java.sql.Date ((new java.util.Date()).getTime());
            String fecha=String.valueOf(fechaSistema);
            String fecha1=fecha.substring(8,10);
            fecha1 = fecha1 + fecha.substring(4,7);
            fecha1 = fecha1 + "-" + fecha.substring(0,4);
            
            FileInputStream NumFactura = null;
            FileOutputStream NumFactura2 = null;
            try {
                NumFactura = new FileInputStream("NumFactura.dat");
            }catch (FileNotFoundException e2) {
                out.println(e2.getMessage());
                out.println("El archivo no existe. Se crea");
                File NumFactura1 = new File("NumFactura.dat");
                    
                try {
                    NumFactura2 = new FileOutputStream("NumFactura.dat");
                    NumFactura2.write(0);
                    NumFactura2.close();
                    NumFactura = new FileInputStream("NumFactura.dat");
                }catch (Exception e3) {
                    System.out.println(e3.getMessage());
                    System.out.println("Error al abrir el archivo de salida");
                }
            }
            int numFactura = 0;
            
            try {
                numFactura=NumFactura.read();
                NumFactura.close();
            }catch (Exception e4) {
                out.println(e4.getMessage());
                out.println("Error al leer o cerrar el archivo");
            }
            numFactura+=1;
            try {
                    NumFactura2 = new FileOutputStream("NumFactura.dat");
                    NumFactura2.write(numFactura);
                    NumFactura2.close();
            } catch (Exception e5) {
                out.println(e5.getMessage());
                out.println("Error al abrir, escribir o cerrar el archivo");
            }
            sesion.setAttribute("numFactura", numFactura);
            int i=0;
            int numLinea=571;
            float total=0;
            float importe=0;
            
            while (i<vPedidos.size()) {
                pedido=(Pedidos)vPedidos.elementAt(i);
                pedidoInternet=new PedidosInternet("","",0,"");
                pedidoInternet.setArticulo(pedido.getArticulo());
                pedidoInternet.setCliente(c.getCodigo());
                pedidoInternet.setUnidades(pedido.getUnidades());
                pedidoInternet.setFecha(fecha);
                
                vPedidosInternet.addElement(pedidoInternet);
                if (numLinea>570) {
                    numLinea=30;
                
            
        %>

        <hr>
        Fecha: <%= fecha1%>
        <br>
        FACTURA N.: <%= numFactura%>
        <br>
        <hr>
        <center>
            <h2>Empresa Proyecto Web de clase, S.A.</h2>
            <h3>N.I.F.: 28938475-J</h3
            <h4>C/ Isla de S&aacute;lvora, 451 - 
            28400 Collado Villalba - Madrid
            </h4>
        </center>
        <hr>
        <b>Cliente: </b><%= c.getCodigo()%> 
        <b>N.I.F.: </b><%= c.getNif()%>
        <br><b>D./D&ntilde;a. </b><%= c.getNombre()%> <%= c.getApellidos()%>
        <br><%= c.getDomicilio()%>
        <br><%= c.getCodigo_postal()%> <%= c.getLocalidad()%>
        <hr>
        <table align=center>
            <tr>
                <td><h3>C&oacute;digo</h3></td>
                <td><h3>Descripci&oacute;n</h3></td>
                <td><h3>Precio</h3></td>
                <td><h3>Unidades</h3></td>
                <td><h3>Importe</h3></td>
            </tr>
        <% } %>
            <tr>
                <td><%= pedido.getArticulo()%></td>
                <td><%= pedido.getDescripcion()%></td>
                <td align=right><%= String.valueOf(pedido.getPrecio())%></td>
                <td align=right><%= String.valueOf(pedido.getUnidades())%></td>
                <td align=right><%= String.valueOf(pedido.getImporte())%></td>
            </tr>   
        <%      total = total + pedido.getImporte();
                i++;
            }
        %>
        </table>
        <hr>
        <h2 id="totalFactura" >
            Total Factura (I.V.A. inc.): <%= String.valueOf(total)%>
        </h2>
        <% //graba los pedidos en la tabla pedidos internet y ejecutar commit
            GestionArticulos gestArt = new GestionArticulos();
            gestArt.commit();
            //GestionPedidos gestPed = new GestionPedidos();
            //gestPed.commit();
            //GestionPedidos gestPed = new GestionPedidos();
            //gestPed.commit();
        %>
        <hr>
    </body>
</html>
