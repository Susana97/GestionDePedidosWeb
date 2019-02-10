<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession sesion = request.getSession(true);
    sesion.setAttribute("Pedidos", new Vector());
    java.sql.Date fechaSistema = new java.sql.Date((new java.util.Date()).getTime());
    String fecha = String.valueOf(fechaSistema);
    String fecha1 = fecha.substring(0, 4);
    int aa1 = new Integer(fecha1).intValue();
    sesion.setAttribute("anioActual", aa1);
%>
<html>
    <head>
        <style type="text/css">
          a {font-size:18px; 
          color:#5dc0a6;}
          body {font-family:  Consolas, monaco, monospace;}
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proyecto Web con Bases de Datos</title>
    </head>
    <body>
        <h1>Proyecto Web con Bases de Datos</h1>
        <a href="PedCodCli.jsp">Gesti&oacute;n de Pedidos</a>

    </body>
</html>
