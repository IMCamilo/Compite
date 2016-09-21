package compite

import grails.transaction.Transactional

/**
 * Created by camilo on 9/1/16.
 */
class UploadController {

    //TODO: esto puede ser un folder a traves de configuracion, de preferencia fuera de la app.
    //TODO: lo puse dentro de la app para demo
    private static final String FILES_PATH = '/home/cjorquera/Documentos/compite/archivos/'

    /**
     * archivo es el nombre del parametro en la peticion
     * @return
     */
    @Transactional
    def upload() {
        def f = request.getFile('archivo')
        if (f.empty) {
            flash.message = 'file cannot be empty'
            render(view: 'uploadForm')
            return
        }
        String filePath = FILES_PATH + f?.filename
        f.transferTo(new File(filePath))
        //TODO: Esto puede ir en un servicio, lo agregue aqui por demostracion
        Archivo archivo = new Archivo(nombre: f?.filename, ruta: filePath, entidad: 'auditoria', creadoPor:'18.653.290-2').save(flush: true)
        //TODO: esto no es necesario, solo es para validar que se creo el objeto -> DEMO
        assert archivo.id
        render(view: '/archivos', model: [message: 'Carga exitosa'])
    }
}
