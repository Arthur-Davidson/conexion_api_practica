//
//  conexion_apiApp.swift
//  conexion_api
//
//  Created by alumno on 3/13/26.
//

import SwiftUI

@main
struct conexion_apiApp: App {
    @State var controlador_general = ControladorGeneral()
    
    var body: some Scene {
        WindowGroup {
            Inicio()
                .environment(controlador_general)
        }
    }
}

#Preview {
    Inicio()
        .environment(ControladorGeneral())
}
