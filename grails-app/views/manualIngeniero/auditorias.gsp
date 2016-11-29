<html>
  <head>
    <meta charset="UTF-8">
    <meta name="layout" content="manual" />
    <title>5. Auditorias - Gaiden</title>
  </head>
  <body>
    <div class="wrapper">
      <div class="header">
        <i class="fa fa-bars sidebar-toggle"></i>
        <span class="title"><a href="index.html">Gaiden</a></span>
      </div>
      <div class="sidebar">
        <ul>
          <li class="numbered visible"><a href="index.html" data-alt-hash="manual-ingeniero"><span class="number">1.</span>Manual Ingeniero</a></li>
          <li class="numbered visible"><a href="Login.html" data-alt-hash="iniciar-sesin"><span class="number">2.</span>Iniciar Sesión</a></li>
          <li class="numbered visible">
            <a href="Ingeniero.html" data-alt-hash="ingeniero"><span class="number">3.</span>Ingeniero</a>
            <ul>
              <li class="numbered visible">
                <a href="Ingeniero.html#modificacin-de-datos"><span class="number">3.1.</span>Modificación de datos</a>
                <ul>
                  <li class="numbered visible"><a href="Ingeniero.html#modificar-contrasea"><span class="number">3.1.1.</span>Modificar Contraseña</a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="numbered visible">
            <a href="Proyectos.html" data-alt-hash="proyectos"><span class="number">4.</span>Proyectos</a>
            <ul>
              <li class="numbered visible"><a href="Proyectos.html#buscar-proyectos"><span class="number">4.1.</span>Buscar Proyectos</a></li>
              <li class="numbered visible"><a href="Proyectos.html#ver-listado-proyectos"><span class="number">4.2.</span>Ver Listado Proyectos</a></li>
              <li class="numbered visible"><a href="Proyectos.html#crear-egreso-a-un-proyecto"><span class="number">4.3.</span>Crear Egreso a un Proyecto</a></li>
              <li class="numbered visible">
                <a href="Proyectos.html#crear-egreso-de-movilizacin-a-proyecto"><span class="number">4.4.</span>Crear Egreso de Movilización a Proyecto</a>
                <ul>
                  <li class="numbered visible"><a href="Proyectos.html#cargar-movilizacin-a-egreso"><span class="number">4.4.1.</span>Cargar Movilización a Egreso</a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="numbered visible">
            <a href="Auditorias.html" data-alt-hash="auditorias"><span class="number">5.</span>Auditorias</a>
            <ul>
              <li class="numbered visible"><a href="Auditorias.html#ver-listado-auditoras"><span class="number">5.1.</span>Ver Listado Auditorías</a></li>
              <li class="numbered visible">
                <a href="Auditorias.html#ver-detalle-auditoras"><span class="number">5.2.</span>Ver Detalle Auditorías</a>
                <ul>
                  <li class="numbered visible"><a href="Auditorias.html#editar-egreso"><span class="number">5.2.1.</span>Editar Egreso</a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li class="numbered visible">
            <a href="Egresos.html" data-alt-hash="egresos"><span class="number">6.</span>Egresos</a>
            <ul>
              <li class="numbered visible"><a href="Egresos.html#ver-listado-de-egresos"><span class="number">6.1.</span>Ver Listado de Egresos</a></li>
              <li class="numbered visible"><a href="Egresos.html#ver-detalle-de-egresos"><span class="number">6.2.</span>Ver Detalle de Egresos</a></li>
              <li class="numbered visible"><a href="Egresos.html#generar-reporte-de-egresos"><span class="number">6.3.</span>Generar Reporte de Egresos</a></li>
            </ul>
          </li>
        </ul>
      </div>
      <div class="content">
        <div class="content-handle"></div>
        <div class="content-container">
          <div class="content-nav content-nav-top">
            <a class="prev-page" href="Proyectos.html">
            <i class="fa fa-angle-left"></i>
            <span class="number">4.</span>
            Proyectos
            </a>
            <a class="next-page" href="Egresos.html">
            <span class="number">6.</span>
            Egresos
            <i class="fa fa-angle-right"></i>
            </a>
          </div>
          <div class="page-toc">
            <ul>
              <li class="numbered visible">
                <a href="#auditorias"><span class="number">5.</span>Auditorias</a>
                <ul>
                  <li class="numbered visible"><a href="#ver-listado-auditoras"><span class="number">5.1.</span>Ver Listado Auditorías</a></li>
                  <li class="numbered visible">
                    <a href="#ver-detalle-auditoras"><span class="number">5.2.</span>Ver Detalle Auditorías</a>
                    <ul>
                      <li class="numbered visible"><a href="#editar-egreso"><span class="number">5.2.1.</span>Editar Egreso</a></li>
                    </ul>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
          <div class="main-content">
            <h1 id="auditorias"><span class="number">5.</span>Auditorias</h1>
            <h2 id="ver-listado-auditoras"><span class="number">5.1.</span>Ver Listado Auditorías</h2>
            <pre><code class="nohighlight">Al ingresar a la vista auditoría podemos ver inmediatamente el listado de auditorías realizadas.
</code></pre>
            <h2 id="ver-detalle-auditoras"><span class="number">5.2.</span>Ver Detalle Auditorías</h2>
            <pre><code class="nohighlight">Al presionar ver dentro del formulario podemos ver el egreso el cual se está auditando con sus respectivos detalles.
</code></pre>
            <h3 id="editar-egreso"><span class="number">5.2.1.</span>Editar Egreso</h3>
            <pre><code class="nohighlight">Al presionar el botón editar dentro del formulario auditoria creamos la posibilidad de realizar cambios en los campos: Fecha Documento, Tipo Documento, Rut a Pagar, Pagado a, Item, N° documento, Tipo Moneda, Monto y concepto. Una vez modificado los campos que se determinen modificar, presionamos el botón actualizar con el cual se guardarán los cambios realizados en el formulario.
</code></pre>
          </div>
          <div class="content-nav content-nav-bottom">
            <a class="prev-page" href="Proyectos.html">
            <i class="fa fa-angle-left"></i>
            <span class="number">4.</span>
            Proyectos
            </a>
            <a class="next-page" href="Egresos.html">
            <span class="number">6.</span>
            Egresos
            <i class="fa fa-angle-right"></i>
            </a>
          </div>
          <div class="footer">
            <p class="credit text-muted">Powered by <a href="https://github.com/kobo/gaiden">Gaiden</a></p>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
