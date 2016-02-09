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
    $("#"+NombreContenedor).load(nombrePagina+'.jsp');
}
function CargarPaginaExterna(NombreContenedor,nombreCarpeta,nombrePagina)
{
    alert(nombreCarpeta);
    //$("#"+NombreContenedor).load('../'+nombreCarpeta+'/'+nombrePagina+'.jsp');
    $("#"+NombreContenedor).load(+nombreCarpeta+'/'+nombrePagina+'.jsp');
}
