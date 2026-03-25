//
//  vista_comentario.swift
//  conexion_api
//
//  Created by alumno on 3/23/26.
//

import SwiftUI

struct VistaComentario: View {
    var comentario: Comentario
    
    var body: some View {
        HStack {
            Image("usuario")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .shadow(radius: 2)
            
            Text("De: \(comentario.name)")
                .font(.headline)
                .foregroundColor(Color("texto_1"))
        }
        Text("\(comentario.body)")
    }
}
