<ul class="nav nav-tabs">
    <li class="active">
        <a data-toggle="tab" href="#home-2">
            <i class="fa fa-home"></i>
        </a>
    </li>
    <li>
        <a data-toggle="tab" href="#about-2">
            <i class="fa fa-navicon"></i>
            Nuevo
        </a>
    </li>
    <li class="">
        <a data-toggle="tab" href="#contact-2">
            <i class="fa fa-remove"></i>
            Eliminar
        </a>
    </li>
</ul>
<div class="panel-body">
    <div class="tab-content">
        <!--Contenido de permisos-->
        <div id="home-2" class="tab-pane active">
            Permisos
        </div>
        <!--Nueva creacion de permisos-->
        <div id="about-2" class="tab-pane">
            <div class="panel-body" >
              <form class="form-horizontal tasi-form" method="get">
                  <div class="form-group">
                      <label class="col-sm-2 col-sm-2 control-label">Nivel</label>
                        <div class="col-xs-5 selectContainer">
                            <select class="form-control" onchange="cambioNivel();" name="cboNivel" id="cboNivel">
                                <option value="0">Padre</option>
                                <option value="1">Hijo</option>
                            </select>
                        </div>
                  </div>
                  <div class="form-group" id="contPadre">
                          <label class="col-sm-2 col-sm-2 control-label">Descripciòn</label>
                            <div class="col-sm-10">
                                <input type="text" name="txtPadreNombre" id="txtPadreNombre" class="form-control">
                           </div>
                      
                  </div>
                  <div class="form-group" id="contHijo" style="display: none;">
                          <label class="col-sm-2 col-sm-2 control-label">Descripciòn</label>
                            <div class="col-sm-10">
                                <input type="text" name="txtHijoNombre" id="txtHijoNombre" class="form-control">
                           </div>
                      
                  </div>
              </form>
            </div>
        </div>
        <!--Eliminacion de permisos-->
        <div id="contact-2" class="tab-pane ">
            Eliminar
        </div>
    </div>
</div>