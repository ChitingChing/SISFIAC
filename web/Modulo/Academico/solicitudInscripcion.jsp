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
        <link href="SISFIAC/img/logoPostgrado.ico" rel="shortcut icon">
        <title>PostGrado UTEQ</title>
        <!-- Bootstrap Core CSS -->
        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <link href="../../css/style.css" rel="stylesheet">
        <link href="../../css/datepicker3.css" rel="stylesheet">
        <!-- Custom CSS
        <link href="css/modern-business.css" rel="stylesheet"> 
        Custom Fonts 
        <link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">        
        <script src="../../js/ajax.js" type="text/javascript"></script> --> 
        <link href="../../css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
        <script src="../../js/jquery.min.js"></script>
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
                    <select id="cmb_Maestria" class="form-control " >
                        <option selected>Maestrá en Marroneo</option>
                    </select>
                </div>

                <fieldset class="form-group datos">
                    <legend class="legend">Datos Personales</legend>
                    <div class="izquierda">
                        <label class="izquierda" for="txt_Ced">Cédula o Pasaporte: </label>
                        <input id="txt_Ced" class="form-control izquierda" type="text" pattern="[0-9]+" required>
                    </div>
                    <div class="izquierda">
                        <label class="izquierda" for="cmb_Est">Estado Civil: </label>
                        <select id="cmb_Est" class="form-control "  >
                            <option selected>Soltero</option>
                            <option>Casado</option>
                            <option>Divorciado</option>
                            <option>Viudo</option>
                            <option>Union Libre</option>
                        </select>
                    </div>

                    <div class="derecha" style="text-align: center">                        
                        <div class="kv-avatar center-block" style="width:200px">
                            <input id="avatar" name="avatar" type="file" class="file-loading">
                        </div>
                        <div id="kv-avatar-errors" class="center-block" style="width:200px;display:none;margin-top: 5px;"></div>
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
                        <label >Sexo: </label>
                        <div>
                            <input id="ckb_SexM" name="sexo" type="radio" required value="M" ><label for="ckb_SexM">Masculino</label> <br>
                            <input id="ckb_SexF" name="sexo" type="radio" required value="F" ><label for="ckb_SexF">Femenino</label>
                        </div>
                    </div>

                </fieldset>
                <%-- DATOS DE NACIMIENTO --%>
                <fieldset class="form-group datos">
                    <legend class="legend">Datos de Nacimiento</legend>
                    <%--datos de nacimiento --%>
                    <div class="izquierda">
                        <label for="cmb_Pais_Origen">País: </label>
                        <select id="cmb_Pais_Origen" class="form-control izquierda"  >
                            <option selected>Ecuador</option>
                            <option>Extranjero</option>                            
                        </select>
                    </div>  
                    <div class="izquierda">
                        <label for="txt_Fecha_Nac">Fecha de Nacimiento: </label>
                        <input id="txt_Fecha_Nac" class="form-control datepicker" type="text" >
                    </div>
                    <div class="izquierda limpiar-izq">
                        <label for="cmb_Prov_Nac">Provincia: </label>
                        <select id="cmb_Prov_Nac" class="form-control izquierda"  >
                            <option selected>Ecuador</option>
                            <option>Extranjero</option>                            
                        </select>
                    </div>  
                    <div class="izquierda">
                        <label  for="cmb_Can_Nac">Cantón: </label>
                        <select id="cmb_Can_Nac" class="form-control izquierda"  >
                            <option selected>Ecuador</option>
                            <option>Extranjero</option>                            
                        </select>
                    </div>  
                    <div class="izquierda">
                        <label for="cmb_Parr_Nac">Parroquia: </label>
                        <select id="cmb_Parr_Nac" class="form-control izquierda"  >
                            <option selected>Ecuador</option>
                            <option>Extranjero</option>                            
                        </select>
                    </div> 

                </fieldset>
                     <%-- DATOS DOMICILIARIOS--%>
                <fieldset class="form-group datos">
                    <legend class="legend">Datos Domiciliarios</legend>                        
                    <div class="izquierda limpiar-izq">
                        <label  for="cmb_Prov_Dom">Provincia: </label>
                        <select id="cmb_Prov_Nac" class="form-control izquierda"  >
                            <option selected>Ecuador</option>
                            <option>Extranjero</option>                            
                        </select>
                    </div>  
                    <div class="izquierda">
                        <label  for="cmb_Can_Dom">Cantón: </label>
                        <select id="cmb_Can_Dom" class="form-control izquierda"  >
                            <option selected>Ecuador</option>
                            <option>Extranjero</option>                            
                        </select>
                    </div>  
                    <div class="izquierda">
                        <label  for="cmb_Parr_Dom">Parroquia: </label>
                        <select id="cmb_Parr_Dom" class="form-control izquierda"  >
                            <option selected>Ecuador</option>
                            <option>Extranjero</option>                            
                        </select>
                    </div> 
                    <div class="izquierda" style="width: 100%">
                        <label  for="txt_Dir_Dom">Dirección: </label>
                        <input id="txt_Dir_Dom" class="form-control">
                    </div>
                    <div class="izquierda">
                        <label  for="txt_Tel_Dom">Teléfono: </label>
                        <input id="txt_Tel_Dom" class="form-control" pattern="[0-9]{9}">
                    </div>
                </fieldset>
                
                   <%-- DATOS LABORALES--%>
                <fieldset class="form-group datos">
                    <legend class="legend">Datos Laborales</legend>                        
                    <div class="izquierda limpiar-izq">
                        <label  for="cmb_Prov_Lab">Provincia: </label>
                        <select id="cmb_Prov_Lab" class="form-control izquierda"  >
                            <option selected>Ecuador</option>
                            <option>Extranjero</option>                            
                        </select>
                    </div>  
                    <div class="izquierda">
                        <label  for="cmb_Can_Lab">Cantón: </label>
                        <select id="cmb_Can_Lab" class="form-control izquierda"  >
                            <option selected>Ecuador</option>
                            <option>Extranjero</option>                            
                        </select>
                    </div>  
                    <div class="izquierda">
                        <label  for="cmb_Parr_Lab">Parroquia: </label>
                        <select id="cmb_Parr_Lab" class="form-control izquierda"  >
                            <option selected>Ecuador</option>
                            <option>Extranjero</option>                            
                        </select>
                    </div> 
                    <div class="izquierda" style="width: 100%">
                        <label  for="txt_Dir_Lab">Dirección: </label>
                        <input id="txt_Dir_Lab" class="form-control">
                    </div>
                    <div class="izquierda">
                        <label  for="txt_Car_Lab">Cargo: </label>
                        <input id="txt_Car_Lab" class="form-control" pattern="[a-zZ-A]{50}">
                    </div>
                    <div class="izquierda">
                        <label  for="txt_Tel_Lab">Teléfono: </label>
                        <input id="txt_Tel_Lab" class="form-control" pattern="[0-9]{9}">
                    </div>
                    <div class="izquierda">
                        <label  for="txt_Email_Lab">Email: </label>
                        <input id="txt_Email_Lab" class="form-control" type="email" >
                    </div>
                </fieldset>
                
                   <%-- DATOS ACADEMICOS--%>
                <fieldset class="form-group datos">
                    <legend class="legend">Datos Académicos</legend>   
                    <div class="izquierda">
                        <label for="cmb_Pais_U">País: </label>
                        <select id="cmb_Pais_U" class="form-control izquierda"  >
                            <option selected>Ecuador</option>
                            <option>Extranjero</option>                            
                        </select>
                    </div>  
                    <div class="izquierda limpiar-izq">
                        <label  for="cmb_Prov_U">Provincia: </label>
                        <select id="cmb_Prov_U" class="form-control izquierda"  >
                            <option selected>Ecuador</option>
                            <option>Extranjero</option>                            
                        </select>
                    </div>  
                    <div class="izquierda">
                        <label  for="cmb_Can_U">Cantón: </label>
                        <select id="cmb_Can_U" class="form-control izquierda"  >
                            <option selected>Ecuador</option>
                            <option>Extranjero</option>                            
                        </select>
                    </div>  
                    <div class="izquierda">
                        <label  for="cmb_Parr_U">Parroquia: </label>
                        <select id="cmb_Parr_U" class="form-control izquierda"  >
                            <option selected>Ecuador</option>
                            <option>Extranjero</option>                            
                        </select>
                    </div> 
                    <div class="izquierda" style="width: 50%">
                        <label  for="txt_Titulo">Título: </label>
                        <input id="txt_Titulo" class="form-control" pattern="[a-zZ-A]{50}">
                    </div>
                    <div class="izquierda" style="width: 45%">
                        <label  for="txt_Universidad">Universidad: </label>
                        <input id="txt_Universidad" class="form-control" pattern="[a-zZ-A]{50}">
                    </div>                    
                </fieldset>
                
                <button class="btn btn-primary" type="submit">Enviar</button>

            </form>
        </div>  
        <%@include file="../../piePagina.jsp" %>
    </body>

</html>
