<title>COMPITE - Administrar</title>
<meta name="layout" content="mainadministrador"/>
<div class="row" style="width:80%">
    <div id="formulario2" class="col s12">
        <div class="card-panel teal lighten-2 90a4ae blue-grey">CREAR NUEVA RENDICIÓN</div>
                <!--aca va el formulario para crear rendiciones-->
        <ul class="collapsible" data-collapsible="expandable" style="width:100%">
            <li>
                <div class="collapsible-header"><i class="material-icons">navigation</i><a href="${createLink(controller:'usuario', action:'index')}">USUARIOS DEL SISTEMA</a></div>
            </li>
            <li>
                <div class="collapsible-header"><i class="material-icons">person_pip</i><a href="${createLink(controller:'proyecto', action:'index')}">PROYECTOS</a></div>

            </li>
            <li>
                <div class="collapsible-header"></a><i class="material-icons">playlist_add</i><a href="${createLink(controller:'auditoria', action:'index')}">AUDITORÍA</a></div>

            </li>
            <li>
                 <div class="collapsible-header"><i class="material-icons">work</i><a href="${createLink(controller:'item', action:'index')}">ITEM´S DE GASTOS</a></div>
             </li>
        </ul>
                <!--"aca va el formulario para crear rendiciones"-->
    </div>

</div>





