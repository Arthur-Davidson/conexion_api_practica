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
        TabView {
            
            // Publicaciones
            Tab("Publicaciones", systemImage: "square.and.pencil") {
                Inicio()
            }
            .badge(controlador.publicaciones.count)
            
            // Perfil
            Tab("Perfil", systemImage: "person.crop.circle.fill") {
                VStack {
                    Text("Perfil del usuario")
                        .font(.title)
                        .foregroundColor(Color("texto_1"))
                        .padding()
                    
                    Text("Aquí podrías agregar foto, nombre, email, etc.")
                        .foregroundColor(Color("texto_2"))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("fondo"))
            }
            
            // Configuración
            Tab("Configuración", systemImage: "gearshape") {
                VStack {
                    Text("Configuración de la app")
                        .font(.title)
                        .foregroundColor(Color("texto_1"))
                        .padding()
                    
                    Text("Opciones de preferencias, notificaciones, etc.")
                        .foregroundColor(Color("texto_2"))
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("fondo"))
            }
            .badge("!")
        }
        .tint(Color("texto_1")) // Iconos y títulos de tab
        .background(Color("fondo").ignoresSafeArea())
    }
}

#Preview {
    MenuBase()
        .environment(ControladorGeneral())
}
