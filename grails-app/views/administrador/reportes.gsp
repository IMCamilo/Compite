<title>COMPITE - Iniciar sesión</title>
<meta name="layout" content="administrador"/>

<nav class="white" role="navigation">
    <div class="nav-wrapper container">
        <a id="logo-container" href="index.html" class="brand-logo">
            <asset:image src="compite/compite2.png" alt="logo" class="img-responsive" width="50%" height="50%" style="padding-top:10px"/>
        </a>
        <ul class="right hide-on-med-and-down">
            <li><a href="login.html">Salir</a></li>
        </ul>
        <ul id="nav-mobile" class="side-nav">
            <li><a href="login.html">Salir</a></li>
        </ul>
        <a href="index.html" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">menu</i></a>
    </div>
</nav>
<div class="row" style="width:80%">
    <div class="section">
        <div id="tabs">
            <ul class="tabs">
                <li class="tab col s4"><a href="${createLink(controller:'administrador', action:'index')}">RENDICIONES DE PROYECTO</a></li>
                <li class="tab col s4"><a href="${createLink(controller:'administrador', action:'administrar')}">ADMINISTRAR</a></li>
                <li class="tab col s4"><a class="active" hrf="${createLink(controller:'administrador', action:'reportes')}">REPORTES</a></li>
            </ul>
        </div>
    </div>
    <div class="formulario">
        <div class="cuadro">RUT
            <input type="text">
        </div>
        <div class="cuadro">Fecha Rendicion
            <input type="text">
        </div>
        <div class="cuadro">Sede Rendicion
            <input type="text">
        </div>
        <div class="cuadro">Nombre Responsable
            <input type="text">
        </div>
        <div class="cuadro">Tipo de Rendicion
            <input type="text">
        </div>
        <table>
            <tr>
                <th>Referencia</th>
                <th>Tipo</th>
                <th>Numero Documento</th>
                <th>Fecha Documento</th>
                <th>RUT</th>
                <th>Pagado A : </th>
                <th>Numero Centro Costo</th>
                <th>Item Presupuestario</th>
                <th>Descripcion</th>
                <th>Valor</th>
            </tr>
            <tr>
                <td>1</td>
                <td>comida</td>
                <td>0255</td>
                <td>21/12/2012</td>
                <td>16.312.334-7</td>
                <td>Adolfo Gonzalez</td>
                <td>0911</td>
                <td>Colacion</td>
                <td>Completos</td>
                <td>$ 5000</td>
            </tr>
            <tr>
                <td>2</td>
                <td>bebidas</td>
                <td>0256</td>
                <td>21/12/2012</td>
                <td>16.312.334-7</td>
                <td>Adolfo Gonzalez</td>
                <td>0911</td>
                <td>Colacion</td>
                <td>Gulden Draak</td>
                <td>$ 8000</td>
            </tr>
        </table>
        <div class="cuadro">Total Rendido
            <input type="text" placeholder="$ 13000">
        </div>
        <div class="cuadro">Total Anticipado
            <input type="text" placeholder="$ 15000">
        </div>
        <div class="cuadro">Saldo a Favor Responsable Rendicion
            <input type="text" placeholder="$ 2000">
        </div>
        <p></p>
        <div class="cuadro">
            <button>LIMPIAR</button>
            <button>VALIDAR</button>
        </div>
    </div>

    <div class="formulario">

        <div class="cuadro">Mantencion Cada 1000 KMS
            <input type="text">
        </div>
        <div class="cuadro">Valor U.F Hoy
            <input type="text">
        </div>
        <div class="cuadro">Rendimiento
            <input type="text">
        </div>
        <div class="cuadro">Seguro Cada 2000kms
            <input type="text">
        </div>
        <div class="cuadro">Valor Bencina Hoy
            <input type="text">
        </div>
        <div class="cuadro">$$ Por Kilometro
            <input type="text">
        </div>
        <div class="cuadro">U.F Por Kilometro
            <input type="text">
        </div>

        <table>
            <tr>
                <th>Numero</th>
                <th>Fecha</th>
                <th>Motivo/Empresa</th>
                <th>Direccion</th>
                <th>Distancia</th>
                <th>Distancia Ida/Vuelta</th>
                <th>Mes</th>
                <th>Estacionamiento</th>
                <th>Peaje</th>
                <th>Tag</th>
                <th>Metro</th>
            </tr>
            <tr>
                <td>1</td>
                <td>12/12/12</td>
                <td>Capacitacion</td>
                <td>Lorem ipsum </td>
                <td>25km</td>
                <td>55km</td>
                <td>12</td>
                <td>$0</td>
                <td>$0</td>
                <td>$0</td>
                <td>$0</td>
            </tr>

        </table>

        <div class="cuadro">ESTACIONAMIENTO
            <input type="text">
        </div>
        <div class="cuadro">TAG
            <input type="text">
        </div>
        <div class="cuadro">PEAJE
            <input type="text">
        </div>
        <div class="cuadro">METRO
            <input type="text">
        </div>
        <div class="cuadro">TOTAL
            <input type="text">
        </div>
    </div>
</div>


