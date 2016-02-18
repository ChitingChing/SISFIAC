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
        Custom Fonts 
        <link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">        
        <script src="../../js/ajax.js" type="text/javascript"></script> --> 
        <link href="../../css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="../../js/fileinput.min.js" type="text/javascript"></script>
        <script src="../../js/bootstrap.min.js"></script>
        <script src="../../js/verFoto.js"></script>
        <!-- estilos para la foto -->
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
    </head>
    <body>
        <div class="wrapper">
            <%@include file="../../encabezado.jsp" %>
            <h1 class="titulo">Solicitud de Inscripción</h1>
            <form role="form" action="" method="post" data-fv-message="NO" enctype="multipart/form-data">
                
                <div class="elegir-maestria">                   
                    <label for="cmb_Maestria"  >Maestría: </label>
                    <select class="form-control " >
                    <option>Maestrá en Marroneo</option>
                    </select>
                </div>
                
                <fieldset class="form-group datos">
                    <legend class="legend">Datos Personales</legend>
                    <div class="izquierda">
                        <label class="izquierda" for="txt_Ced">Cédula o Pasaporte: </label>
                        <input id="txt_Ced" class="form-control izquierda" type="text" pattern="[0-9]+" required>
                    </div>

                    <div class="derecha" style="text-align: center">                        
                        <div class="kv-avatar center-block" style="width:200px">
                            <input id="avatar" name="avatar" type="file" class="file-loading">
                        </div>
                        <div id="kv-avatar-errors" class="center-block" style="width:200px;display:none;"></div>
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
    </body>

</html>
