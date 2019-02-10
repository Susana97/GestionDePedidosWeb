<%@page import="java.util.Vector"%>
<%@page import="ClasesJava.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% 
        HttpSession sesion = request.getSession();
        sesion.setAttribute("Cliente", new Cliente("","","","","","", 
                "", "", "", "", "", "0"));
        sesion.setAttribute("Pedidos", new Vector());
        /*Borro el atributo Pedidos del objeto HttpSession con los que pedidos
        que se hubieran podido realizar por el cliente anterior.
        Esta opción solo es necesaria para cuando se acceda a esta página
        desde las páginas posteriores. */
        
        String mensaje = "Gesti&oacute;n de Pedidos";
        String url = "PedidosBuscarCliente.jsp";
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=mensaje%></title>
        <style type="text/css">
          a {font-size:18px; 
          color:#5dc0a6;}
          body {font-family:  Consolas, monaco, monospace;}
        </style>
    </head>
    <body onload="document.FormularioCliente.codigoCl.focus()">
        <h1><%=mensaje%></h1>
        <br/>
        
        <form name="FormularioCliente" action="<%=url%>" method="post" 
            onsubmit="return TodoCorrecto_submit()">
            
            C&oacute;digo del cliente: 
            <input type="text" name="codigoCl" size="4" maxlength="6"/>
            <br/><br/>
            <input type="submit" value="Aceptar"/>
            <input type="reset" value="Cancelar" 
                   onclick="document.FormularioCliente.codigoCl.focus()"/>
        </form><br/>
        <a href="index.jsp">P&aacute;gina Principal</a>
        
        <script language="JavaScript" type="text/javascript">
            function TodoCorrecto_submit(){
                //si no se introduce ningun dato no se envía nada.
                with(document.FormularioCliente.codigoCl){
                    if(value == ""){
                        alert("No ha introducido el código");
                        focus();
                        return false;
                    }else{
                        for(i=1;value.length<6;i++){
                            value="0"+value;
                        }
                        return true;
                    }
                }
            }
        </script>
    </body>
</html>
