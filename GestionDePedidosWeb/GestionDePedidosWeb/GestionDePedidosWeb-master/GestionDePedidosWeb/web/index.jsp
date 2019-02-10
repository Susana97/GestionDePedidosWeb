<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="ClasesJava.*"%>
<% 
    HttpSession sesion = request.getSession(true);
    sesion.setAttribute("Pedidos", new ArrayList<Pedido>());
    Date fechaSistema = new Date(new java.util.Date().getTime());
    
    String fecha = String.valueOf(fechaSistema);
    String fecha1 = fecha.substring(0,4);
    int anioActual1 = new Integer(fecha1).intValue();
    sesion.setAttribute("AnioActual", anioActual1);
%>
<html>
    <head>
        <title>Proyecto Web con Bases de Datos</title>
    </head>
    <body>
        <h1>Proyecto Web con Bases de Datos</h1>
        <a href="GestionDePedidos.jsp">Gestión de Pedidos</a>

    </body>
</html>
