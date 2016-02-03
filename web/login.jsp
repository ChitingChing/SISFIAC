<%-- 
    Document   : login
    Created on : 03/02/2016, 10:15:04
    Author     : Usuario 09
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Postgrado</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilos-login.css" rel="stylesheet">
    </head>
    <body>
        <form class="login-form" method="POST" action="ControlUsuarios.dbo">
            <h2 class="form-signin-heading">Inicia Sesión</h2>
            <label for="txt_User" class="sr-only">Número de Cédula</label>
            <input id="txt_User" class="form-control login-form-input" placeholder="Número de cédula" 
                   required="" autofocus="" pattern="^([a-z]+[0-9]{0,2}){5,12}$" title="Ingrese su nick/usuario!" value="" />
            <label for="txt_Pass" class="sr-only">Clave</label>
            <input id="txt_Pass" class="form-control login-form-input" placeholder="Clave" required="" type="password" value="" />
            <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
        </form>
    </body>
</html>
