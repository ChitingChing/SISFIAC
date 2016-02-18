/*  Mostrar el cuadro de diálogo*/
            


function mostrarCuadroDialogoPersonalizado(NombreContenedor)
{
   var MiContenedor="#"+NombreContenedor;
   var jQueryDialog1Opts =
   {
      width: 280,
      height: 100,
      position: { my: 'center', at: 'center', of: window },
      resizable: true,
      draggable: true,
      closeOnEscape: true,
      autoOpen: true
   };
   $(MiContenedor).dialog(jQueryDialog1Opts); 
}



// Esto es para cargar una página sin parámetros....
function CargarPaginaInterna(NombreContenedor,nombrePagina)
{
    $("#"+NombreContenedor).html('<div><center><img src="../img/ajax-loader.gif"/></center></div>');
    $("#"+NombreContenedor).load(nombrePagina+'.jsp');
}
function CargarPaginaExterna(NombreContenedor,nombreCarpeta,nombrePagina)
{
    $("#"+NombreContenedor).html('<div><center><img src="../img/ajax-loader.gif"/></center></div>');
    $("#"+NombreContenedor).load('../'+nombreCarpeta+'/'+nombrePagina+'.jsp');
}
function CargarPaginaURL(NombreContenedor,ruta)
{
    $("#"+NombreContenedor).html('<div><center><img src="../img/ajax-loader.gif"/></center></div>');
    $("#"+NombreContenedor).load(ruta+'.jsp');
}
//Seleccion de nivel padre e hijo
function cambioNivel(){
    if($("#cboNivel").val()== "0"){
        $("#contHijo").css("display","none");
        $("#contHijo1").css("display","none");
        $("#contPadre label").remove();
        $("#contPadre div").remove();
        $("#contPadre").append("<label class=\"col-sm-2 col-sm-2 control-label\">Descripciòn</label>\n"+
                      "<div class=\"col-sm-10\">\n"+
                          "<input type=\"text\" name=\"txtPadreNombre\" id=\"txtPadreNombre\" class=\"form-control\">\n"+
                      "</div>");
    }else{
        $("#contPadre label").remove();
        $("#contPadre div").remove();
        $("#contHijo").css("display","block");
        $("#contHijo1").css("display","block");
        //Cargar Padres
        $.ajax({
            url: "../obtenerPermisoPadres.dbo",
            dataType: "text",
            data: {
                codigo:$("#cboNivel").val()
            },//reques evia el parametro que digito
            success: function (data) {
                var str="";
                str = "<label class=\"col-sm-2 col-sm-2 control-label\">Padre</label>\n" +
"                        <div class=\"col-xs-5 selectContainer\">\n" +
"                            <select class=\"form-control\" name=\"cboPadre\" id=\"cboPadre\">\n";
                var parsed = JSON.parse(data);
                for (var i = 0; i < parsed.length; i++) {
                         str += "<option value=\""+parsed[i].id+"\">"+parsed[i].nombre+"</option>\n"; 
                      }
                    if(parsed.length <= 0)
                        str +="<option value=\"-1\">(No hay datos)</option>\n"; 
                        
                        str +="</select>\n" +
"                        </div>";
                         $("#contPadre").append(str);
                           // response(parsed);
                        },error: function (message) {
                        response([]);
                    }
                });
    }
}
function cambioUsuario(){
    //obtener_arbol_permisos.dbo
    var _estado = false;
    $("#contArbolPermisos").html('<div><center><img src="../img/ajax-loader.gif"/></center></div>');
    if($("#cboUsuario").val() != "-1"){
        $.ajax({
            url: "../obtener_arbol_permisos.dbo",
            dataType: "text",
            data: {
                codigo:$("#cboUsuario").val()
            },//reques evia el parametro que digito
            success: function (data) {
                var str="";
                $("#contArbolPermisos div").remove();
                var parsed = JSON.parse(data);
                for (var i = 0; i < parsed.length; i++) {
                    if(parsed[i].padre == 0){
                        str += "<div class=\"panel-heading\">\n" +
"                                            <input class=\""+parsed[i].id+"\" type=\"checkbox\" onchange=\"seleccionPardre("+parsed[i].id+");\" name=\"chk\" id=\"chk\"  value=\""+parsed[i].id+"\">\n" +
"                                            <a class=\"panel-title collapsed menu-collapse\" data-toggle=\"collapse\" data-parent=\"#panel-izquierdo\" href=\"#panel-element-"+i+"\">\n" +
"                                                 "+parsed[i].nombre+"    <span class=\"glyphicon glyphicon-collapse-down icon-right\"></span></a>\n" +
"                                    </div>\n";
                        str += "<div id=\"panel-element-"+i+"\" class=\"panel-collapse collapse\">\n";
                    }
                         for (var j = 0; j < parsed.length; j++) {
                             if(parsed[i].id == parsed[j].padre){
                                 if(parsed[j].estado == 10){
                                    str +="<div class=\"panel-body icon-right\">\n" +
"                                                <input class=\""+parsed[i].id+"\" type=\"checkbox\" onchange=\"seleccionHijo("+parsed[i].id+",this);\" checked=\"true\" name=\"chk id=\"chk\"  value=\""+parsed[j].id+"\"> <a class=\"cursor\">"+parsed[j].nombre+"</a>\n" +
"                                            </div>\n";
                                 }
                                 else{
                                     str +="<div class=\"panel-body icon-right\">\n" +
"                                                <input class=\""+parsed[i].id+"\" type=\"checkbox\" onchange=\"seleccionHijo("+parsed[i].id+",this);\" name=\"chk id=\"chk\"  value=\""+parsed[j].id+"\"> <a class=\"cursor\">"+parsed[j].nombre+"</a>\n" +
"                                            </div>\n";
                                 }
                             }
                         }
                         str += "</div>";  
                      }
                    if(parsed.length <= 0){
                        //str +="<option value=\"-1\">(No hay datos)</option>\n"; 
                    }
                        
                         $("#contArbolPermisos").append(str);
                           // response(parsed);
                        },error: function (message) {
                        response([]);
                    }
                });
    }else{
        $("#contArbolPermisos div").remove();
    }
    
}
//Funcion para seleccionar padre y de una se asignen permisos para hijo y viceversa
function seleccionPardre(id){
    
    if($( "."+id).length>0){
        //Padre
        guardarPermisoUsuarios($( "."+id)[0].value,1);
        for (var i = 0; i < $( "."+id).length-1; i++) {
            
            if($( "."+id)[0].checked){
                $( "."+id)[i+1].checked= true;
                guardarPermisoUsuarios($( "."+id)[i+1].value,1);
            }
            else{
                $( "."+id)[i+1].checked= false;
                guardarPermisoUsuarios($( "."+id)[i+1].value,0);
            }
        }
    }
}
//Volveremos
//Falta Guardar Padre
function seleccionHijo(id,estado){
   var _estado = "";
   //Padre
   guardarPermisoUsuarios($( "."+id)[0].value,1);
   if(estado.checked)
        guardarPermisoUsuarios(estado.value,1);
    else
        guardarPermisoUsuarios(estado.value,0);
}

function guardarPermisoUsuarios(id,estado){
    $.ajax({
            url: "../registrarPermisosxUsuarios.dbo",
            dataType: "text",
            data: {
                permisoId:id,
                permisoUs:$("#cboUsuario").val(),
                estado:estado
            },//reques evia el parametro que digito
            success: function (data) {
                
            }
             });
}


function registrarPadre(){
    
    var nombre="";
    var codigo="";
    if($("#cboNivel").val() == 0){
        nombre = $("#txtPadreNombre").val();
        codigo = $("#cboNivel").val();
    }else{
        nombre = $("#txtHijoNombre").val();
        codigo = $("#cboPadre").val();
    }
    $.ajax({
            url: "../registrarPermisos.dbo",
            dataType: "text",
            data: {
                codigo:codigo,//Nivel
                orden: $("#cboOrden").val(),//Orden
                nombre: nombre,
                contenedor: $("#txtConten").val(),
                ruta: $("#txtForm").val()
            },//reques evia el parametro que digito
            success: function (data) {
                           if(data.toString() === "ok"){
                               alert("Error al ingresar Datos");
                           }else{
                               alert("Datos Ingresados Correctamente");
                               $("#txtPadreNombre").val("");
                               $("#txtHijoNombre").val("");
                               $("#txtConten").val("");
                               $("#txtForm").val("");
                           }
                            
                        },error: function (message) {
                        response([]);
                    }
                });
}