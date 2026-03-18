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
        if( controlador.publicacion == nil){
            switch(controlador.estado){
                case .descargando_publicacion:
                    Text("Descargando los datos")
                    
                case .en_espera:
                    Text("\(controlador.publicacion)")
                        .onAppear{
                            controlador.descargar_publicacion(id: id)
                        }
                    
                case .error_en_descarga:
                    Text("Existe un error en la descarga")
                default:
                    Text("Si ves esto, puedes mostrar esta pantalla por una galleta.")
            }
        }
        else {
            //Text("\(controlador.estado)")
            
            Text("Publicacion: \(controlador.publicacion?.title ?? "")")
            
            ScrollView(.horizontal) {
                ForEach(controlador.publicacion?.comentarios ?? [Comentario]()){ comentarios in
                    Text("Comentario: \(comentarios.body)")
                    Text("Escrito por: \(comentarios.name)")
                }
            }
            
        }
    }
}

#Preview {
    PantallaPublicacion(id: 2)
        .environment(ControladorGeneral())
}
