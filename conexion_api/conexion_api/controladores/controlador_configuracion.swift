//
//  controlador_configuracion.swift
//  conexion_api
//
//  Created by alumno on 3/27/26.
//

import SwiftUI

enum EstadosConfiguracion {
    case cargando
    case listo
    case guardando
    case error
}

@Observable
class ControladorConfiguracion {
    
    var estado: EstadosConfiguracion = .cargando
    
    var notificaciones_activas: Bool = false
    var datos_moviles: Bool = false
    var nombre_usuario: String = " "
    var version_app: String = "1.0.0"
    
    func cargar_configuracion() {
        estado = .cargando
        
        Task {
            try await Task.sleep(for: .seconds(2))
            
            // Simulación de configuración
            notificaciones_activas = true
            
            // Descarga de usuario
            let url = "\(url_base)/users/7"
            
            if let usuario: Usuario = await ServicioAPI.descargar_informacion(desde: url) {
                nombre_usuario = usuario.name
            } else {
                nombre_usuario = "Error"
            }
            
            estado = .listo
        }
    }
    
    func guardar_configuracion() {
        estado = .guardando
        
        Task {
            try await Task.sleep(for: .seconds(2))
            
            // Simulación guardado
            estado = .listo
        }
    }
}
