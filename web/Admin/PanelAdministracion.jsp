<%-- 
    Document   : PanelAdministracion
    Created on : 03/02/2016, 11:47:55
    Author     : Usuario08
--%>

<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.sql.Array"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="AccesoDatos.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <meta name="description" content="Postgrado UTEQ">
    <meta name="author" content="SISFIAC">
    <link href="../img/logoPostgrado.ico" rel="shortcut icon">
    <title>Panel de Administración</title>
    
    <!-- bootstrap 3.0.2 -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- font Awesome -->
    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="../css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Morris chart -->
    <link href="../css/morris.css" rel="stylesheet" type="text/css" />
    <!-- jvectormap -->
    <link href="../css/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <!-- Date Picker -->
    <link href="../css/datepicker3.css" rel="stylesheet" type="text/css" />
    <!-- fullCalendar -->
    <!-- <link href="css/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" /> -->
    <!-- Daterange picker -->
    <link href="../css/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
    <!-- iCheck for checkboxes and radio inputs -->
    <link href="../css/all.css" rel="stylesheet" type="text/css" />
    <!-- bootstrap wysihtml5 - text editor -->
    <!-- <link href="css/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css" rel="stylesheet" type="text/css" /> -->
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    
    <!-- Theme style -->
    <link href="../css/styleAdmin.css" rel="stylesheet" type="text/css" />
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link href="../css/styleLG.css" rel="stylesheet" type="text/css" />
    <script src="../js/ajax.js" type="text/javascript"></script>
    <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>

          <script>document.write('<script src="http://' + (location.host || 'localhost').split(':')[0] + ':35729/livereload.js?snipver=1"></' + 'script>')</script>
      </head>
      <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <header class="header">
            
            <a href="../Admin/PanelAdministracion.jsp" class="logo">
                <%@include file="controlUsuarios.jsp" %>
            </a>
            <!-- Header Navbar: style can be found in header.less -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="navbar-right">
                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->
                        <li class="dropdown messages-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-envelope"></i>
                                <span class="label label-success">4</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">You have 4 messages</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li><!-- start message -->
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="../img/26115.jpg" class="img-circle" alt="User Image"/>
                                                </div>
                                                <h4>
                                                    Support Team
                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                                <small class="pull-right"><i class="fa fa-clock-o"></i> 5 mins</small>
                                            </a>
                                        </li><!-- end message -->
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="img/26115.jpg" class="img-circle" alt="user image"/>
                                                </div>
                                                <h4>
                                                    Director Design Team

                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                                <small class="pull-right"><i class="fa fa-clock-o"></i> 2 hours</small>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="img/avatar.png" class="img-circle" alt="user image"/>
                                                </div>
                                                <h4>
                                                    Developers

                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                                <small class="pull-right"><i class="fa fa-clock-o"></i> Today</small>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="img/26115.jpg" class="img-circle" alt="user image"/>
                                                </div>
                                                <h4>
                                                    Sales Department

                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                                <small class="pull-right"><i class="fa fa-clock-o"></i> Yesterday</small>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div class="pull-left">
                                                    <img src="img/avatar.png" class="img-circle" alt="user image"/>
                                                </div>
                                                <h4>
                                                    Reviewers

                                                </h4>
                                                <p>Why not buy a new awesome theme?</p>
                                                <small class="pull-right"><i class="fa fa-clock-o"></i> 2 days</small>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="footer"><a href="#">See All Messages</a></li>
                            </ul>
                        </li>
                        <li class="dropdown tasks-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-tasks"></i>
                                <span class="label label-danger">9</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="header">You have 9 tasks</li>
                                <li>
                                    <!-- inner menu: contains the actual data -->
                                    <ul class="menu">
                                        <li><!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Design some buttons
                                                    <small class="pull-right">20%</small>
                                                </h3>
                                                <div class="progress progress-striped xs">
                                                    <div class="progress-bar progress-bar-success" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">20% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                        <li><!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Create a nice theme
                                                    <small class="pull-right">40%</small>
                                                </h3>
                                                <div class="progress progress-striped xs">
                                                    <div class="progress-bar progress-bar-danger" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">40% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                        <li><!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Some task I need to do
                                                    <small class="pull-right">60%</small>
                                                </h3>
                                                <div class="progress progress-striped xs">
                                                    <div class="progress-bar progress-bar-info" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">60% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                        <li><!-- Task item -->
                                            <a href="#">
                                                <h3>
                                                    Make beautiful transitions
                                                    <small class="pull-right">80%</small>
                                                </h3>
                                                <div class="progress progress-striped xs">
                                                    <div class="progress-bar progress-bar-warning" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                        <span class="sr-only">80% Complete</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </li><!-- end task item -->
                                    </ul>
                                </li>
                                <li class="footer">
                                    <a href="#">View all tasks</a>
                                </li>
                            </ul>
                        </li>
                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-user"></i>
                                <span><%=session.getAttribute("usuario")%><i class="caret"></i></span>
                            </a>
                            <ul class="dropdown-menu dropdown-custom dropdown-menu-right">
                                <li class="dropdown-header text-center">Cuenta</li>
                                    <li>
                                        <a href="#">
                                        <i class="fa fa-user fa-fw pull-right"></i>
                                            Perfil
                                        </a>
                                        <a data-toggle="modal" href="#modal-user-settings">
                                        <i class="fa fa-cog fa-fw pull-right"></i>
                                            Ajustes
                                        </a>
                                        </li>

                                        <li class="divider"></li>

                                        <li>
                                            <a href="../cerrarSesion.dbo"><i class="fa fa-ban fa-fw pull-right"></i> Salir</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </header>
                <div class="wrapper row-offcanvas row-offcanvas-left">
                    <!-- Left side column. contains the logo and sidebar -->
                    <aside class="left-side sidebar-offcanvas" >
                        <!-- sidebar: style can be found in sidebar.less -->
                        <section class="sidebar">
                            <!-- Sidebar user panel -->
                            <div class="user-panel">
                                <div class="pull-left image">
                                    <img src="../img/26115.jpg" class="img-circle" alt="User Image" />
                                </div>
                                <div class="pull-left info">
                                    <p>Hola</p>

                                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                                </div>
                            </div>
                                    <hr>
                            <ul class="sidebar-menu">
                                <li class="active">
                                    <a href="../index.jsp">
                                        <i class="fa fa-home"></i> <span>Inicio</span>
                                    </a>
                                </li>
                                <%
                                  if(session.getAttribute("rol") != null){
                                    if(session.getAttribute("rol").equals("Administrador")){
                                %>
                                <li>
                                    <a class="cursor" onclick="CargarPaginaInterna('cargar_Elementos','permisosUsuarios')">
                                        <i class="fa fa-globe"></i> <span>Permisos</span>
                                    </a>
                                </li>
                                <%}}%>

                            </ul>
                             <!--Menu dinamico Por usuarios-->
                             <div id="cargarMenuUsuarios">
                             <%! 
                                 int i = 0, j=0;
                                 ResultSet rs;
                                 ArrayList padre = new ArrayList();
                                 ArrayList nombre = new ArrayList();
                                 ArrayList urls = new ArrayList();
                                 ArrayList _id = new ArrayList();
                                 boolean band = false;
                             %>
                            <%
                                padre.clear();
                                nombre.clear();
                                urls.clear();
                                _id.clear();
                                String valor = "";
                                    Conexion conex = new Conexion();
                                    
                                    if(session.getAttribute("id") != null)
                                        valor =  session.getAttribute("id").toString();
                                    String [] param = {valor};
                                    String [] paramTipo = {"int"};
                                     try {
                                 rs = conex.EjecutarProcedimietoFullParametrosxTipoValor("obtenerMenuNavUsuario", param, paramTipo);
                                 
                                 while(rs.next()){
                                     padre.add(rs.getInt(1));
                                     nombre.add(rs.getString(2));
                                     urls.add(rs.getString(3));
                                     _id.add(rs.getInt(4));
                                 }conex.Cerrar();
                                     }catch (Exception e) {
            }%>
                                    
                            <%
                                for(i = 0;i<padre.size();i++){
                                if(Integer.parseInt(padre.get(i).toString())==0){
                                    band = false;
                                    for(j = 0;j<padre.size();j++){
                                        if(Integer.parseInt(_id.get(i).toString())==Integer.parseInt(padre.get(j).toString())){
                                            band = true;
                                        }
                                    }
                                 if(band){
                            %>
                                    <ul class="sidebar-menu">
                                        <li class="activePI">
                                            <a class="panel-title collapsed menu-collapse" data-toggle="collapse" data-parent="#panel-izquierdo" href="#panel-element<%=i%>">
                                                <!--<span class="glyphicon glyphicon-user icon-leftP"></span>--><%=nombre.get(i).toString()%><span class="glyphicon glyphicon-collapse-down icon-rightP"></span></a>
                                        </li>
                                    </ul>
                                                <div id="panel-element<%=i%>" class="panel-collapse collapse">
                            <%
                                
                                for(j = 0;j<padre.size();j++){
                                    if(Integer.parseInt(_id.get(i).toString())==Integer.parseInt(padre.get(j).toString())){%>
                                        <div class="panel-body icon-right">
                                            <a class="cursor" onclick="<%=urls.get(j)%>"><%=nombre.get(j).toString()%></a>
                                        </div>
                            <%}}%>
                                </div>
                                
                            <%}}}%>
                            </div>
                           <!--Fin del Menu dinamico-->
                        </section>
                        <!-- /.sidebar -->
                    </aside>

                    <aside class="right-side">

                <!-- Main content -->
                <section class="content">
                    <!-- Main row -->
                    <div class="row">

                        <div class="col-md-12">
                            <!--earning graph start-->
                            <section class="panel">
                                <header class="panel-heading encabezado">
                                    Movimientos
                                </header>
                                <div class="panel-body">
                                    <div id="cargar_Elementos">
                                        
                                    </div>
                                </div>
                                        </section>
                                        <!--earning graph end-->

                                    </div>
                      </div>


                  </div>
                    
                    
              <!-- row end -->
                </section><!-- /.content -->
                <div class="footer-main">
                    <%@include file="../piePagina.jsp" %>
                </div>
            </aside><!-- /.right-side -->

        </div><!-- ./wrapper -->


        
        <script src="../js/jquery.min.js" type="text/javascript"></script>

        <!-- jQuery UI 1.10.3 -->
        <script src="../js/jquery-ui-1.10.3.min.js" type="text/javascript"></script>
        <!-- Bootstrap -->
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <!-- daterangepicker -->
        <script src="../js/daterangepicker.js" type="text/javascript"></script>

        <script src="../js/chart.js" type="text/javascript"></script>

        <!-- datepicker
        <script src="js/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>-->
        <!-- Bootstrap WYSIHTML5
        <script src="js/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js" type="text/javascript"></script>-->
        <!-- iCheck -->
        <script src="../js/icheck.min.js" type="text/javascript"></script>
        <!-- calendar -->
        <script src="../js/fullcalendar.js" type="text/javascript"></script>

        <!-- Director App -->
        <script src="../js/app.js" type="text/javascript"></script>

        <!-- Director dashboard demo (This is only for demo purposes) -->
        <script src="../js/dashboard.js" type="text/javascript"></script>

        <!-- Director for demo purposes -->
        <script type="text/javascript">
            $('input').on('ifChecked', function(event) {
                // var element = $(this).parent().find('input:checkbox:first');
                // element.parent().parent().parent().addClass('highlight');
                $(this).parents('li').addClass("task-done");
                console.log('ok');
            });
            $('input').on('ifUnchecked', function(event) {
                // var element = $(this).parent().find('input:checkbox:first');
                // element.parent().parent().parent().removeClass('highlight');
                $(this).parents('li').removeClass("task-done");
                console.log('not');
            });

        </script>
        <script>
            $('#noti-box').slimScroll({
                height: '400px',
                size: '5px',
                BorderRadius: '5px'
            });

            $('input[type="checkbox"].flat-grey, input[type="radio"].flat-grey').iCheck({
                checkboxClass: 'icheckbox_flat-grey',
                radioClass: 'iradio_flat-grey'
            });
</script>

</body>
</html>
