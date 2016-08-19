<meta name="layout" content="auditoria/auditoria.main"/>
<div class="navbar-fixed">
    <nav class="white" role="navigation">
        <div class="nav-wrapper container">
            <a id="logo-container" href="index.html" class="brand-logo">
                <asset:image src="compite/compite2.png" alt="logo" class="img-responsive" width="50%" height="50%" style="padding-top:10px"/>
            </a>

            <ul class="right hide-on-med-and-down">
                <li><a href="${createLink(controller:'auditoria', action:'list')}">Listar</a></li>
                <li><a href="${createLink(controller:'auditoria', action:'create')}">Nuevo Registro</a></li>
                <li><a href="${createLink(controller:'login', action:'login')}">Carrar Sesión</a></li>
            </ul>
        </div>
    </nav>
</div>

<div class="container">
    <div class="row">
        <form class="col s12">
            <g:form action="save">
                <div class="input-field col s6">
                    <g:select name="usuario" from="${usuarios}" optionValue="nombres" optionKey="id"/>
                    <label>Usuario</label>
                </div>
                <div class="input-field col s6">
                    <input id="datepicker1" name="fecha" value="" type="date" class="datepicker">
                    <label for="datepicker1">Fecha</label>
                </div>
                <div class="input-field col s12">
                    <g:textArea id="desc" class="materialize-textarea" name="descripcion"/>
                    <label for="desc">Descripción</label>
                </div>
                <!--
                Fecha <g:datePicker name="fecha" value="${new Date()}" noSelection="['':'Selecciona Mes']"/>
                Descripcion <g:textArea name="descripcion" value="" rows="5" cols="40"/>
                -->

                <g:actionSubmit class="waves-effect waves-light btn" value="Save"/>
            </g:form>
        </form>
    </div>
</div>