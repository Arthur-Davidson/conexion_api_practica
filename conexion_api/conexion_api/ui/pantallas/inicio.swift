//
//  inicio.swift
//  conexion_api
//
//  Created by alumno on 3/13/26.
//

import SwiftUI

struct Inicio: View {
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Fondo
                Color("fondo")
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    // Título de publicaciones
                    ZStack {
                        Color("texto_1")
                            .frame(height: 100)

                        
                        Text("Publicaciones")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    
                    // Contenido dinámico
                    switch controlador.estado {
                        
                    case .descargando_publicaciones:
                        Spacer()
                        
                        ProgressView("Cargando...")
                            .font(.title2)
                            .scaleEffect(1.1)
                            .foregroundColor(Color("texto_2"))
                        
                        Spacer()
                        
                    case .en_espera:
                        ScrollView {
                            VStack(spacing: 16) {
                                ForEach(controlador.publicaciones) { publicacion in
                                    
                                    NavigationLink {
                                        PantallaPublicacion(id: publicacion.id)
                                    } label: {
                                        
                                        VStack(alignment: .leading, spacing: 8) {
                                            
                                            HStack(alignment: .center, spacing: 12) {
                                                Image("usuario")
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 40, height: 40)
                                                    .clipShape(Circle())
                                                    .shadow(radius: 2)
                                                
                                                Text(publicacion.title)
                                                    .font(.headline)
                                                    .foregroundColor(Color("texto_2"))
                                                    .lineLimit(2)
                                                    .multilineTextAlignment(.leading)
                                            }
                                            
                                            Text("Ver más...")
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color("tarjeta"))
                                        .cornerRadius(12)
                                        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                                    }
                                    .buttonStyle(.plain)
                                    .simultaneousGesture(
                                        TapGesture().onEnded {
                                            controlador.publicacion = nil
                                            controlador.descargar_publicacion(id: publicacion.id)
                                        }
                                    )
                                }
                            }
                            .padding()
                        }
                        
                    case .descargando_publicacion:
                        Spacer()
                        ProgressView()
                        Spacer()
                        
                    case .error_en_descarga:
                        Spacer()
                        Text("ERROR: Asegúrate de tener wifi")
                            .foregroundColor(.red)
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    Inicio()
        .environment(ControladorGeneral())
}
