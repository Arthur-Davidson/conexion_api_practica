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
        Text("Cuerpo: \(comentario.body)")
        Text("De: \(comentario.name)")
    }
}
