//
//  controlador_usuario.swift
//  conexion_api
//
//  Created by alumno on 3/25/26.
//

// Gestionar la descarga y el control de un usuario
import SwiftUI

enum EstadosBasicos{
    case descargando
    case error_en_la_descarga
    case esperando
}

@Observable
class ControladorUsuario{
    var estado: EstadosBasicos = .esperando
    var usuario: Usuario? = nil
    
    func descargar_usuario(id: Int){
        estado = .descargando
        
        Task{
            try await Task.sleep(for: .seconds(2))
            
            await _descargar_usuario(id: id)
        }
        
    }
    
    private func _descargar_usuario(id: Int) async {
        let url_del_usuario: String = "\(url_base)/users/\(id)"
        
        if let usuario_descargado: Usuario = await ServicioAPI.descargar_informacion(desde: url_del_usuario){
            // Si logramos descargar la informacion, por que no tenemos un nil de regreso, entonces todo esta bien
            usuario = usuario_descargado
            estado = .esperando
        }
        else {
            // Si recivimos un nil, entonces algo salio mal y debo poner una pantalla de error
            estado = .error_en_la_descarga
            
        }
    }
    
}
