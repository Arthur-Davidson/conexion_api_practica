//
//  pantalla_usuario.swift
//  conexion_api
//
//  Created by alumno on 3/25/26.
//

import SwiftUI

struct PantallaUsuario: View {
    var id: Int
    
    @State var gestor_usuario = ControladorUsuario()
    
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
                        
                        Text("Usuario")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    // Contenido
                    VStack {
                        switch(gestor_usuario.estado) {
                            
                        case .descargando:
                            Spacer()
                            VStack(spacing: 12) {
                                Image(systemName: "arrow.down.circle.fill")
                                    .symbolEffect(.breathe)
                                    .font(.largeTitle)
                                    .foregroundColor(Color("texto_2"))
                                
                                Text("Cargando usuario...")
                                    .foregroundColor(Color("texto_2"))
                            }
                            Spacer()
                        
                        case .error_en_la_descarga:
                            Spacer()
                            Text("Hay un problema en alguna parte")
                                .foregroundColor(.red)
                                .font(.headline)
                            Spacer()
                        
                        case .esperando:
                            if let usuario = gestor_usuario.usuario {
                                
                                ScrollView {
                                    VStack(spacing: 16) {
                                        
                                        // Tarjeta usuario
                                        VStack(spacing: 12) {
                                            
                                            Image("usuario")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 80, height: 80)
                                                .clipShape(Circle())
                                                .shadow(radius: 4)
                                            
                                            Text(usuario.name)
                                                .font(.title2)
                                                .bold()
                                                .foregroundColor(Color("texto_1"))
                                            
                                            VStack(alignment: .leading, spacing: 16) {
                                                
                                                // Información personal
                                                VStack(alignment: .leading, spacing: 10) {
                                                    Text("Información personal")
                                                        .font(.headline)
                                                        .foregroundColor(Color("texto_1"))
                                                    
                                                    HStack {
                                                        Image(systemName: "person.fill")
                                                        Text("Nombre: \(usuario.name)")
                                                    }
                                                    
                                                    HStack {
                                                        Image(systemName: "at")
                                                        Text("Username: \(usuario.username)")
                                                    }
                                                    
                                                    HStack {
                                                        Image(systemName: "envelope.fill")
                                                        Text("Email: \(usuario.email)")
                                                    }
                                                }
                                                .foregroundColor(Color("texto_2"))
                                                
                                                
                                                // Contacto
                                                VStack(alignment: .leading, spacing: 10) {
                                                    Text("Contacto")
                                                        .font(.headline)
                                                        .foregroundColor(Color("texto_1"))
                                                    
                                                    HStack {
                                                        Image(systemName: "phone.fill")
                                                        Text("Teléfono: \(usuario.phone)")
                                                    }
                                                    
                                                    HStack {
                                                        Image(systemName: "globe")
                                                        Text("Sitio web: \(usuario.website)")
                                                    }
                                                }
                                                .foregroundColor(Color("texto_2"))
                                                
                                                
                                                // Empresa
                                                VStack(alignment: .leading, spacing: 10) {
                                                    Text("Empresa")
                                                        .font(.headline)
                                                        .foregroundColor(Color("texto_1"))
                                                    
                                                    HStack {
                                                        Image(systemName: "building.2.fill")
                                                        Text(usuario.company.name)
                                                    }
                                                }
                                                .foregroundColor(Color("texto_2"))
                                            }
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color("tarjeta"))
                                        .cornerRadius(16)
                                        .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 3)
                                    }
                                    .padding()
                                }
                                
                            } else {
                                Spacer()
                                Text("Error 404")
                                    .foregroundColor(.red)
                                    .font(.headline)
                                Spacer()
                            }
                        }
                    }
                }
            }
            .onAppear {
                gestor_usuario.descargar_usuario(id: id)
            }
        }
    }
}

#Preview {
    PantallaUsuario(id: 5)
}
