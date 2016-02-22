<%-- 
    Document   : login
    Created on : 03/02/2016, 10:15:04
    Author     : Usuario 09
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Postgrado UTEQ">
        <meta name="author" content="SISFIAC">
        <link href="img/logoPostgrado.ico" rel="shortcut icon">
        <title>Login Postgrado</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/styleLG.css" rel="stylesheet">
        <link href="css/estilos-login.css" rel="stylesheet">
        <script type="text/javascript" src="js/ajax.js"></script>
    </head>
    <body class="imgCargandoo">

        <div class="wrapper">
            <%@include file="encabezado.jsp" %>

            <form class="login-form" method="POST" onsubmit="muestraGranDiv();" action="ControlUsuarios.dbo">
                <h2 class="form-signin-heading">Inicia Sesión</h2>
                <label for="txt_User" class="sr-only">Usuario/Nick</label>
                <input id="txt_User" name="txt_User" class="form-control login-form-input" placeholder="usuario" 
                       required="" autofocus="" pattern="^([a-z]+[0-9]{0,2}){5,12}$" title="Ingrese su nick/usuario!" value="" />
                <label for="txt_Pass" class="sr-only">Clave</label>
                <input id="txt_Pass" name="txt_Pass" class="form-control login-form-input" placeholder="Clave" required="" type="password" value="" />
                <div class="procesando">
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
                </div>
                
                <%
                    if (session.getAttribute("error") != null)
                        if (session.getAttribute("error").equals("error")) {
                            session.removeAttribute("error");
                %>
                <label class="text-danger text-center">Usuario o Clave Incorrecta</label>
                <%} else if (session.getAttribute("Cedula") == null) {
                            response.sendRedirect("index.jsp");
                        }
                %>
                <a class="clave-form" href="">¿Has olvidado tu clave?</a>
            </form>
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>

            <!-- Bootstrap Core JavaScript -->
            <script src="js/bootstrap.min.js"></script>
        </div>
        <%@include file="piePagina.jsp" %>

    </body>
</html>
