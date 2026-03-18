//
//  menu_base.swift
//  conexion_api
//
//  Created by alumno on 3/18/26.
//

import SwiftUI

struct MenuBase: View {
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        TabView{
            Tab("Publicaciones", systemImage: "square.and.pencil") {
                Inicio()
            }
            .badge(controlador.publicaciones.count)
            
            
            Tab("Perfil", systemImage: "person.crop.circle.fill") {
                Text("Deberia hacer una pantalla de el perfil")
            }
            
            
            Tab("Configuración", systemImage: "gearshape") {
                Text("Tambien una de configuracion")
            }
            .badge("!")
        }
    }
}

#Preview{
    MenuBase()
        .environment(ControladorGeneral())
}
