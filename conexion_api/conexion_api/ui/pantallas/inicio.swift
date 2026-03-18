//
//  inicio.swift
//  conexion_api
//
//  Created by alumno on 3/13/26.
//

import SwiftUI

struct Inicio: View {
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        Text("Hola mundo")
        
        switch(controlador.estado){
            case .descargando_datos:
                Text("Cargando, por favor espere")
            
            case .mostrando_datos:
            NavigationStack{
                ScrollView{
                    ForEach(controlador.publicaciones){
                        publicacion in NavigationLink{
                            PantallaPublicacion(id: publicacion.id)
                        } label: {
                            Text(publicacion.title)
                        }.onTapGesture(perform:) {
                            <#code#>
                        }
                    }
                }
            
            }
            
            case .error_en_descarga:
                Text("ERROR: Asegurate de estar conectado a una red")
        }
        
        /*Text("El estado actual del controlador es: \(controlador.estado)")
            .onAppear{
                controlador
                    .descargar_publicaciones()
            }*/
    }
}

#Preview {
    Inicio()
        .environment(ControladorGeneral())
}
