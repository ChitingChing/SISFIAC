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

//Seleccion de nivel padre e hijo
function cambioNivel(){
    if($("#cboNivel").val()== "0"){
        $("#contHijo").css("display","none");
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
                nombre: nombre
            },//reques evia el parametro que digito
            success: function (data) {
                           if(data.toString() === "ok"){
                               alert("Error al ingresar Datos");
                           }else{
                               alert("Datos Ingresados Correctamente");
                               $("#txtPadreNombre").val("");
                               $("#txtHijoNombre").val("");
                           }
                            
                        },error: function (message) {
                        response([]);
                    }
                });
}