//
//  pantalla_publicacion.swift
//  conexion_api
//
//  Created by alumno on 3/13/26.
//

import SwiftUI

struct PantallaPublicacion: View {
    @Environment(ControladorGeneral.self) var controlador
    
    var id: Int

    var body: some View {
        NavigationStack {
            ZStack {
                
                // Fondo
                Color("fondo")
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    // Header
                    ZStack {
                        Color("texto_1")
                            .frame(height: 80)
                        
                        Text("Publicación")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    // Contenido
                    VStack {
                        switch(controlador.estado){
                            
                        case .descargando_publicacion:
                            Spacer()
                            VStack(spacing: 12) {
                                Image(systemName: "arrowshape.down.circle")
                                    .symbolEffect(.bounce.down, options: .repeat(3))
                                    .font(.largeTitle)
                                    .foregroundColor(Color("texto_2"))
                                
                                Text("Descargando...")
                                    .foregroundColor(Color("texto_2"))
                            }
                            Spacer()
                        
                        case .en_espera:
                            if let publicacion = controlador.publicacion {
                                ScrollView {
                                    VStack {
                                        VistaPublicacion(publicacion: publicacion)
                                    }
                                    .padding()
                                }
                            }
                            else {
                                Spacer()
                                Text("Error en la descarga")
                                    .foregroundColor(.red)
                                    .font(.headline)
                                Spacer()
                            }
                        
                        case .error_en_descarga:
                            Spacer()
                            Text("Existe un error en la descarga")
                                .foregroundColor(.red)
                                .font(.headline)
                            Spacer()
                            
                        default:
                            Spacer()
                            Text("Si ves esto, puedes mostrar esta pantalla por una galleta.")
                                .foregroundColor(Color("texto_2"))
                                .multilineTextAlignment(.center)
                                .padding()
                            Spacer()
                        }
                    }
                }
            }
            .onAppear{
                controlador.descargar_publicacion(id: id)
            }
        }
    }
}

#Preview {
    PantallaPublicacion(id: 2)
        .environment(ControladorGeneral())
}
