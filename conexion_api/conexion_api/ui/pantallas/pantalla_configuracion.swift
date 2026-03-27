//
//  pantalla_configuracion.swift
//  conexion_api
//
//  Created by alumno on 3/27/26.
//

import SwiftUI

struct PantallaConfiguracion: View {
    
    @State var controlador = ControladorConfiguracion()
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color("fondo")
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    // Header
                    ZStack {
                        Color("texto_1")
                            .frame(height: 80)
                        
                        Text("Configuración")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    VStack {
                        
                        switch(controlador.estado) {
                            
                        case .cargando:
                            Spacer()
                            VStack(spacing: 12) {
                                Image(systemName: "arrow.down.circle.fill")
                                    .symbolEffect(.breathe)
                                    .font(.largeTitle)
                                    .foregroundColor(Color("texto_2"))
                                
                                Text("Cargando configuración...")
                                    .foregroundColor(Color("texto_2"))
                            }
                            Spacer()
                            
                        case .guardando:
                            Spacer()
                            ProgressView("Guardando...")
                            Spacer()
                            
                        case .error:
                            Spacer()
                            Text("Error al cargar configuración")
                                .foregroundColor(.red)
                            Spacer()
                            
                        case .listo:
                            ScrollView {
                                VStack(spacing: 20) {
                                    
                                    // Perfil
                                    VStack(spacing: 12) {
                                        
                                        Image("usuario")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 80)
                                            .clipShape(Circle())
                                            .shadow(radius: 4)
                                        
                                        Text(controlador.nombre_usuario)
                                            .font(.title3)
                                            .bold()
                                            .foregroundColor(Color("texto_1"))
                                        
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color("tarjeta"))
                                    .cornerRadius(16)
                                    
                                    
                                    // Preferencias y aplicacion
                                    VStack(alignment: .leading, spacing: 16) {
                                        
                                        Text("Preferencias")
                                            .font(.headline)
                                            .foregroundColor(Color("texto_1"))
                                        
                                        Toggle("Notificaciones", isOn: $controlador.notificaciones_activas)
                                        
                                        Toggle("Usar datos moviles", isOn: $controlador.datos_moviles)
                                        
                                        Text("Aplicación")
                                            .font(.headline)
                                            .foregroundColor(Color("texto_1"))
                                        
                                        HStack {
                                            Image(systemName: "info.circle")
                                            Text("Versión: \(controlador.version_app)")
                                        }
                                        
                                    }
                                    .padding()
                                    .background(Color("tarjeta"))
                                    .cornerRadius(16)
                                        
                                    // Guardar
                                    Button("Guardar cambios") {
                                        controlador.guardar_configuracion()
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color("texto_1"))
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                    
                                    
                                    // Cerrar Sesion
                                    Button("Cerrar sesión") {
                                        print("Sesión cerrada")
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                    
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
            .onAppear {
                controlador.cargar_configuracion()
            }
        }
    }
}

#Preview {
    PantallaConfiguracion()
}
