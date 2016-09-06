package compite

import grails.transaction.Transactional

/**
 * Created by camilo on 9/1/16.
 */
class ArchivoController {
    //TODO: esto puede ser un folder a traves de configuracion, de preferencia fuera de la app. (application.yml)
    private static final String FILES_PATH = '/home/camilo/Documentos/compite/archivos/'
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
        //TODO: Esto puede ir en un servicio
        //recibe un parametro llamado entidad, si este controlador se invoca desde empresa entonces debe pasar entidad=empresa
        Archivo uploadFile = new Archivo(nombre: f?.filename, ruta: filePath, entidad: "ninguna", creadoPor: "userlogged").save(flush: true)
        //TODO: esto no es necesario, solo es para validar que se creo el objeto
        assert uploadFile.id
        render(view: '/archivos', model: [message: 'Carga exitosa'])
    }
}
