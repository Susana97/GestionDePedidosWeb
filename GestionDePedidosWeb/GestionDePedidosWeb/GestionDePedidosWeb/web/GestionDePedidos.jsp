<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de pedidos</title>
    </head>
    <body>
        <h1>Gestión de Pedidos</h1>
        Código del cliente:
        <input name="codigoCliente" onclick= "validarCodigo()" id="codigoCliente" type="text" size="5" 
               maxlength="30" autofocus autocomplete>
        <br><br>
        <button type="button" onclick="botonAceptar()">Aceptar</button> 
        <button type="button">Cancelar</button> 
        <br><a href="index.jsp">Página principal</a>
        <script language="JavaScript" type="text/javascript">
           function botonAceptar(f){
               if(codigoCliente.value == ""){
                  alert("El código del cliente no es válido"); 
                  focus();
               }
           }
        </script>
    </body>
</html>
