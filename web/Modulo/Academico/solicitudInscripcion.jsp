<%-- 
    Document   : solicitudInscripcion
    Created on : 12/02/2016, 11:44:39
    Author     : Usuario 09
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Postgrado UTEQ">
        <meta name="author" content="SISFIAC">
        <link href="img/logoPostgrado.ico" rel="shortcut icon">
        <title>PostGrado UTEQ</title>
        <!-- Bootstrap Core CSS -->
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <link href="../../css/style.css" rel="stylesheet">
        <!-- Custom CSS
        <link href="css/modern-business.css" rel="stylesheet"> 
        <!-- Custom Fonts -->
        <link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="../../css/style.css" rel="stylesheet" type="text/css" />
        <script src="../../js/ajax.js" type="text/javascript"></script>
        <!-- jQuery 2.0.2 -->
<style>
.kv-avatar .file-preview-frame,.kv-avatar .file-preview-frame:hover {
    margin: 0;
    padding: 0;
    border: none;
    box-shadow: none;
    text-align: center;
}
.kv-avatar .file-input {
    display: table-cell;
    max-width: 220px;
}
</style>

        <script>document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')</script>
    </head>
    <body>
        <div class="wrapper">
            <%@include file="../../encabezado.jsp" %>
            <h1 style="margin-top: 100px;text-align: center">Solicitud de Inscripción</h1>
            <form role="form" action="" method="post" data-fv-message="NO">
                <fieldset class="form-group datos">
                    <legend class="legend">Datos Personales</legend>
                    <div class="izquierda">
                        <label class="izquierda" for="txt_Ced">Ced o Pasaporte: </label>
                        <input id="txt_Ced" class="form-control izquierda" type="text" pattern="[0-9]+" required>
                    </div>

                    <div class="derecha">
                        <label >Subir Foto</label>
                        <div class="input-group" style="width: 250px">                            
                            <span class="input-group-btn ">
                                <span class="btn btn-default btn-file ">
                                    Buscar: <input  type="file" id="imgInp">
                                </span>
                            </span>
                            <input type="text"  class="form-control " style="width: 200px" readonly>
                        </div>
                        <img class="derecha" id='img-upload' src="../../img/user.png"/>
                    </div> 
                    
                  

                    <div class="izquierda limpiar-izq">
                        <label for="txt_Nom">Nombres: </label>
                        <input id="txt_Nom" class="form-control" type="text" pattern="[A-Za-z]+">
                    </div>
                    <div class="izquierda">
                        <label for="txt_Ape">Apellidos: </label>
                        <input id="txt_Ape" class="form-control" type="text" pattern="[a-zA-Z]+">
                    </div>
                    <div class="izquierda">
                        <label for="txt_Email">Email: </label>
                        <input id="txt_Email" class="form-control" type="email" >
                    </div>
                    <div class="izquierda">
                        <label for="txt_Cel">Celular: </label>
                        <input id="txt_Cel" class="form-control" pattern="[0-9]{10}">
                    </div>
                    <div class="izquierda limpiar-izq">
                        <label for="ckb_SexM">Sexo: </label>
                        <input id="ckb_SexM" name="sexo" type="radio"  value="M" >Masculino <br>
                        <input id="ckb_SexF" name="sexo" type="radio" value="F" >Femenino
                    </div>
                </fieldset>
                <button class="btn btn-primary" type="submit">Enviar</button>
            </form>
        </div>        
        <%@include file="../../piePagina.jsp" %>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="../../js/bootstrap.min.js"></script>
        <script src="../../js/verFoto.js"></script>

    </body>

</html>
