<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'rendicion.label', default: 'Rendicion')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:stylesheet src="compite/autocomplete.css"/>
    </head>
    <body>
        <a href="#create-rendicion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-rendicion" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.rendicion}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.rendicion}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <fieldset class="form">
                    <div class="fieldcontain required" id="desdeinputdiv">
                        <label for="tipo">Desde<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="desde" type="text" required="" placeholder="Ciudad de Origen">
                    </div>
                    <div class="fieldcontain required" id="hastainputdiv">
                        <label for="tipo">Hasta<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="hasta" type="text" required="" placeholder="Ciudad de Destino">
                    </div>
                    <div class="fieldcontain required" id="iteminputdiv">
                        <label for="tipo">Item<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="itemNombre" type="text" required="" placeholder="Ciudad de Destino">
                    </div>
                    <div class="fieldcontain required" id="proyectoinputdiv">
                        <label for="tipo">Proyecto<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="proyectoNombre" type="text" required="" placeholder="Ciudad de Destino">
                    </div>
                    <div class="fieldcontain required" id="usuarioinputdiv">
                        <label for="tipo">Usuario<span class="required-indicator">*</span></label>
                        <input class="typeahead" name="usuarioNombre" type="text" required="" placeholder="Ciudad de Destino">
                    </div>
                    <div class="fieldcontain required">
                        <label for="tipo">Descripción<span class="required-indicator">*</span></label>
                        <textarea  name="descripcion" required="" rows="4" cols="50"></textarea>
                    </div>
                    <div class="fieldcontain required">
                        <label for="tipo">Kilometro Inicial<span class="required-indicator">*</span></label>
                        <input type="number" name="kmInicial" required=""/>
                    </div>
                    <div class="fieldcontain required">
                        <label for="tipo">Kilometro Final<span class="required-indicator">*</span></label>
                        <input type="number" name="kmFinal" required=""/>
                    </div>
                    <div class="fieldcontain required">
                        <label for="tipo">Distancia<span class="required-indicator">*</span></label>
                        <input type="number" name="distancia" required=""/>
                    </div>
                    <div class="fieldcontain required">
                        <label for="tipo">Tiempo<span class="required-indicator">*</span></label>
                        <input type="number" name="tiempo" required=""/>
                    </div>
                    <div class="fieldcontain required">
                        <label for="tipo">Estado<span class="required-indicator">*</span></label>
                        <input type="text" name="estado" required=""/>
                    </div>
                    <div class="fieldcontain required">
                        <label for="tipo">Tipo<span class="required-indicator">*</span></label>
                        <input type="text" name="tipo" required=""/>
                    </div>
                    <div class="fieldcontain required">
                        <label for="tipo">Motivo<span class="required-indicator">*</span></label>
                        <input type="text" name="motivo" required=""/>
                    </div>
                    <div class="fieldcontain required">
                        <label for="tipo">Nombre<span class="required-indicator">*</span></label>
                        <input type="text" name="nombre" required=""/>
                    </div>
                    <div class="fieldcontain required">
                        <label for="tipo">Total<span class="required-indicator">*</span></label>
                        <input type="number" name="total" required=""/>
                    </div>
                    <input name="creadoPor" value="${session.usuarioLogueado.rut}" required="" type="hidden">
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
        <asset:javascript src="compite/jquery-2.1.1.min.js"/>
        <asset:javascript src="compite/typeahead.bundle.js"/>
        <script>
            $(document).ready(function() {
                var substringMatcher = function(strs) {
                    return function findMatches(q, cb) {
                        var matches, substringRegex;
                        matches = [];
                        substrRegex = new RegExp(q, 'i');
                        $.each(strs, function(i, str) {
                            if (substrRegex.test(str)) {
                                matches.push(str);
                            }
                        });
                        cb(matches);
                    };
                };
                var ciudades = [
                    'Arica - Región de Arica y Parinacota','Iquique - Región de Tarapacá','Alto Hospicio - Región de Tarapacá','Pozo Almonte - Región de Tarapacá','Antofagasta - Región de Antofagasta','Calama - Región de Antofagasta','Tocopilla - Región de Antofagasta','Taltal - Región de Antofagasta','Mejillones - Región de Antofagasta','María Elena - Región de Antofagasta','Copiapó - Región de Atacama','Caldera - Región de Atacama','Tierra Amarilla - Región de Atacama','Chañaral - Región de Atacama','Diego de Almagro - Región de Atacama','El Salvador - Región de Atacama','Vallenar - Región de Atacama','Huasco - Región de Atacama','La Serena - Región de Coquimbo','Coquimbo - Región de Coquimbo','Punitaqui - Región de Coquimbo','Andacollo - Región de Coquimbo','Vicuña - Región de Coquimbo','Illapel - Región de Coquimbo','Los Vilos - Región de Coquimbo','Salamanca - Región de Coquimbo','Ovalle - Región de Coquimbo','Combarbalá - Región de Coquimbo','Monte Patria - Región de Coquimbo','El Palqui - Región de Coquimbo','Valparaíso - Región de Valparaíso','Concón - Región de Valparaíso','Viña del Mar - Región de Valparaíso','Villa Alemana - Región de Valparaíso','Quilpué - Región de Valparaíso','Placilla de Peñuelas - Región de Valparaíso','Gran San Antonio - Región de Valparaíso','San Antonio - Región de Valparaíso','Santo Domingo - Región de Valparaíso','Cartagena - Región de Valparaíso','Gran Quillota - Región de Valparaíso','Quillota - Región de Valparaíso','Hijuelas - Región de Valparaíso','La Calera - Región de Valparaíso','La Cruz - Región de Valparaíso','San Felipe - Región de Valparaíso','Casablanca - Región de Valparaíso','Las Ventanas - Región de Valparaíso','Quintero - Región de Valparaíso','Los Andes - Región de Valparaíso','Calle Larga - Región de Valparaíso','Rinconada - Región de Valparaíso','San Esteban - Región de Valparaíso','La Ligua - Región de Valparaíso','Cabildo - Región de Valparaíso','Limache - Región de Valparaíso','Nogales - Región de Valparaíso','El Melón - Región de Valparaíso','Olmué - Región de Valparaíso','Algarrobo - Región de Valparaíso','El Quisco - Región de Valparaíso','El Tabo - Región de Valparaíso','Catemu - Región de Valparaíso','Llaillay - Región de Valparaíso','Putaendo - Región de Valparaíso','Villa Los Almendros - Región de Valparaíso','Santa María - Región de Valparaíso','Rancagua - Región del Libertador General Bernardo O 'Higgins', 'Machalí - Región del Libertador General Bernardo O'Higgins','Gultro - Región del Libertador General Bernardo O 'Higgins', 'Codegua - Región del Libertador General Bernardo O'Higgins','Doñihue - Región del Libertador General Bernardo O 'Higgins', 'Lo Miranda - Región del Libertador General Bernardo O'Higgins','Graneros - Región del Libertador General Bernardo O 'Higgins', 'Las Cabras - Región del Libertador General Bernardo O'Higgins','San Francisco de Mostazal - Región del Libertador General Bernardo O 'Higgins', 'Peumo - Región del Libertador General Bernardo O'Higgins','Punta Diamante - Región del Libertador General Bernardo O 'Higgins', 'Quinta de Tilcoco - Región del Libertador General Bernardo O'Higgins','Rengo - Región del Libertador General Bernardo O 'Higgins', 'Requínoa - Región del Libertador General Bernardo O'Higgins','San Vicente de Tagua Tagua - Región del Libertador General Bernardo O 'Higgins', 'Pichilemu - Región del Libertador General Bernardo O'Higgins','San Fernando - Región del Libertador General Bernardo O 'Higgins', 'Chimbarongo - Región del Libertador General Bernardo O'Higgins','Nancagua - Región del Libertador General Bernardo O 'Higgins', 'Palmilla - Región del Libertador General Bernardo O'Higgins','Santa Cruz - Región del Libertador General Bernardo O 'Higgins', 'Talca - Región del Maule', 'Curicó - Región del Maule', 'Linares - Región del Maule', 'Constitución - Región del Maule', 'San Clemente - Región del Maule', 'Cauquenes - Región del Maule', 'Hualañé - Región del Maule', 'Molina - Región del Maule', 'Teno - Región del Maule', 'Longaví - Región del Maule', 'Parral - Región del Maule', 'San Javier - Región del Maule', 'Villa Alegre - Región del Maule', 'Concepción - Región del Biobío ', 'Talcahuano - Región del Biobío ', 'Chiguayante - Región del Biobío ', 'Coronel - Región del Biobío ', 'Hualqui - Región del Biobío ', 'Lota - Región del Biobío ', 'Penco - Región del Biobío ', 'Tomé - Región del Biobío ', 'Hualpén - Región del Biobío', 'San Pedro de la Paz) - Región del Biobío', 'Chillán - Región del Biobío', 'Chillán Viejo - Región del Biobío', 'Los Ángeles - Región del Biobío', 'Santa Juana - Región del Biobío', 'Lebu - Región del Biobío', 'Arauco - Región del Biobío', 'Cañete - Región del Biobío', 'Curanilahue - Región del Biobío', 'Los Álamos - Región del Biobío', 'Cabrero - Región del Biobío', 'Monte Águila - Región del Biobío', 'Conurbación La Laja-San Rosendo - Región del Biobío', 'Mulchén - Región del Biobío', 'Nacimiento - Región del Biobío', 'Santa Bárbara - Región del Biobío', 'Huépil - Región del Biobío', 'Yumbel - Región del Biobío', 'Bulnes - Región del Biobío', 'Coelemu - Región del Biobío', 'Coihueco - Región del Biobío', 'Quillón - Región del Biobío', 'Quirihue - Región del Biobío', 'San Carlos - Región del Biobío', 'Yungay - Región del Biobío', 'Temuco - Región de la Araucanía ', 'Padre Las Casas - Región de la Araucanía', 'Labranza - Región de la Araucanía', 'Carahue - Región de la Araucanía', 'Cunco - Región de la Araucanía', 'Freire - Región de la Araucanía', 'Gorbea - Región de la Araucanía', 'Lautaro - Región de la Araucanía', 'Loncoche - Región de la Araucanía', 'Nueva Imperial - Región de la Araucanía', 'Pitrufquén - Región de la Araucanía', 'Pucón - Región de la Araucanía', 'Villarrica - Región de la Araucanía', 'Angol - Región de la Araucanía', 'Collipulli - Región de la Araucanía', 'Curacautín - Región de la Araucanía', 'Purén - Región de la Araucanía', 'Renaico - Región de la Araucanía', 'Traiguén - Región de la Araucanía', 'Victoria - Región de la Araucanía', 'Valdivia - Región de Los Ríos', 'Futrono - Región de Los Ríos', 'La Unión - Región de Los Ríos', 'Lanco - Región de Los Ríos', 'Los Lagos - Región de Los Ríos', 'San José de la Mariquina - Región de Los Ríos', 'Paillaco - Región de Los Ríos', 'Panguipulli - Región de Los Ríos', 'Río Bueno - Región de Los Ríos', 'Puerto Montt - Región de Los Lagos  ', 'Puerto Varas - Región de Los Lagos', 'Calbuco - Región de Los Lagos', 'Fresia - Región de Los Lagos', 'Frutillar - Región de Los Lagos', 'Los Muermos - Región de Los Lagos', 'Llanquihue - Región de Los Lagos', 'Castro - Región de Los Lagos', 'Ancud - Región de Los Lagos', 'Quellón - Región de Los Lagos', 'Osorno - Región de Los Lagos', 'Purranque - Región de Los Lagos', 'Río Negro - Región de Los Lagos', 'Coyhaique - Región de Aysén del General Carlos Ibáñez del Campo', 'Puerto Aysén - Región de Aysén del General Carlos Ibáñez del Campo', 'Punta Arenas - Región de Magallanes y de la Antártica Chilena', 'Puerto Natales - Región de Magallanes y de la Antártica Chilena', 'Santiago - Región Metropolitana de Santiago ', 'Cerrillos - Región Metropolitana de Santiago ', 'Cerro Navia - Región Metropolitana de Santiago ', 'Conchalí - Región Metropolitana de Santiago ', 'El Bosque - Región Metropolitana de Santiago ', 'Estación Central - Región Metropolitana de Santiago ', 'Huechuraba - Región Metropolitana de Santiago ', 'Independencia - Región Metropolitana de Santiago ', 'La Cisterna - Región Metropolitana de Santiago ', 'La Florida - Región Metropolitana de Santiago ', 'La Granja - Región Metropolitana de Santiago ', 'La Pintana - Región Metropolitana de Santiago ', 'La Reina - Región Metropolitana de Santiago ', 'Las Condes - Región Metropolitana de Santiago ', 'Lo Barnechea - Región Metropolitana de Santiago ', 'Lo Espejo - Región Metropolitana de Santiago ', 'Lo Prado - Región Metropolitana de Santiago ', 'Macul - Región Metropolitana de Santiago ', 'Maipú - Región Metropolitana de Santiago ', 'Ñuñoa - Región Metropolitana de Santiago ', 'Pedro Aguirre Cerda - Región Metropolitana de Santiago ', 'Peñalolén - Región Metropolitana de Santiago ', 'Providencia - Región Metropolitana de Santiago ', 'Pudahuel - Región Metropolitana de Santiago ', 'Quilicura - Región Metropolitana de Santiago ', 'Quinta Normal - Región Metropolitana de Santiago ', 'Recoleta - Región Metropolitana de Santiago ', 'Renca - Región Metropolitana de Santiago ', 'San Joaquín - Región Metropolitana de Santiago ', 'San Miguel - Región Metropolitana de Santiago ', 'San Ramón - Región Metropolitana de Santiago ', 'Vitacura - Región Metropolitana de Santiago ', 'Puente Alto - Región Metropolitana de Santiago ', 'San Bernardo - Región Metropolitana de Santiago ', 'Padre Hurtado - Región Metropolitana de Santiago ', 'Pirque - Región Metropolitana de Santiago', 'San José de Maipo - Región Metropolitana de Santiago', 'Colina - Región Metropolitana de Santiago', 'Lampa - Región Metropolitana de Santiago', 'Batuco - Región Metropolitana de Santiago', 'Tiltil - Región Metropolitana de Santiago', 'Buin - Región Metropolitana de Santiago', 'Alto Jahuel - Región Metropolitana de Santiago', 'Bajos de San Agustín - Región Metropolitana de Santiago', 'Paine - Región Metropolitana de Santiago', 'Hospital - Región Metropolitana de Santiago', 'Melipilla - Región Metropolitana de Santiago', 'Curacaví - Región Metropolitana de Santiago', 'Calera de Tango - Región Metropolitana de Santiago', 'Talagante - Región Metropolitana de Santiago', 'El Monte - Región Metropolitana de Santiago', 'Isla de Maipo - Región Metropolitana de Santiago', 'La Islita - Región Metropolitana de Santiago', 'Peñaflor - Región Metropolitana de Santiago'
                ];
                $('#desdeinputdiv .typeahead').typeahead({
                    hint: true,
                    highlight: true,
                    minLength: 1
                }, {
                    name: 'ciudades',
                    source: substringMatcher(ciudades)
                });
            });
        </script>
    </body>
</html>
