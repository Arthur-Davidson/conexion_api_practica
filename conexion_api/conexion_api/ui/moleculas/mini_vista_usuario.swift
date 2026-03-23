//
//  mini_vista_usuario.swift
//  conexion_api
//
//  Created by alumno on 3/23/26.
//

import SwiftUI

struct MiniVistaUsuario: View {
    var usuario: Usuario
    
    var body: some View {
        Text("Nombre: \(usuario.name)")
    }
}
