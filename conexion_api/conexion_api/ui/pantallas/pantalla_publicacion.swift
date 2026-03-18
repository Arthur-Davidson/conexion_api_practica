//
//  pantalla_publicacion.swift
//  conexion_api
//
//  Created by alumno on 3/13/26.
//

import SwiftUI

struct PantallaPublicacion: View {
    
    var id: Int
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        if (controlador.publicacion == nil){

            switch(controlador.estado){
                case .descargando_publicaciones:
                    Text("Descargando los datos")
                
            case .en_espera:
                if(controlador.publicacion == nil){
                    Text("Descargando los datos")
                        .onAppear{
                            controlador.descargar_publicacion(id: id)
                        }
                }
                Text("\(controlador.publicacion)")
                
            case .error_en_descarga:
                Text("Error en la descarga")
                
            default:
                Text("Si ves esto, algo salió mal")
            }
        }
        else {
            Text("\(controlador.publicacion?.titulo ?? "No hay publicaciones")
        }
    }
}

#Preview {
    PantallaPublicacion(id: 2)
}
