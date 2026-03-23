//
//  vista_publicacion.swift
//  conexion_api
//
//  Created by alumno on 3/23/26.
//

import SwiftUI

struct VistaPublicacion: View{
    var publicacion: Publicacion
    
    var body: some View{
        Text("Publicacion_: \(publicacion.title)")
        
        VStack{
            if let usuario = publicacion.usuario{
                MiniVistaUsuario(usuario: usuario)
            }
            else {
                Text("Error")
            }
        }
        ScrollView{
            ForEach(publicacion.comentarios ?? []){comentario in
                VistaComentario(comentario: comentario)
            }
        }
    }
}

#Preview{
    PantallaPublicacion(id: 3)
        .environment(ControladorGeneral())
}
