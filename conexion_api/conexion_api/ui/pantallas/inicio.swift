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
        NavigationStack{
            switch(controlador.estado){
                case .descargando_publicaciones:
                    Text("CArgando, por favor espera")
                    
                case .en_espera:
                    ScrollView{
                        ForEach(controlador.publicaciones){ publicacion in
                            NavigationLink{
                                PantallaPublicacion(id: publicacion.id)
                            } label: {
                                Text(publicacion.title)
                            }
                            /*.simultaneousGesture(TapGesture().onEnded {
                                controlador.publicacion = nil
                                controlador.descargar_publicacion(id: publicacion.id)
                            }
                            )*/
                            
                        }
                    }
                    
                    
                case .descargando_publicacion:
                    Image(systemName: "arrowshape.down.circle")
                        .symbolEffect(.pulse)
                case .error_en_descarga:
                    Text("ERROR: Asegurate de tener wifi!!!")
            }
        }
        .onAppear{
            controlador.descargar_publicaciones()
        }
        
    }
}

#Preview {
    Inicio()
        .environment(ControladorGeneral())
}
