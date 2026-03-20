//
//  pantalla_publicacion.swift
//  conexion_api
//
//  Created by alumno on 3/13/26.
//

import SwiftUI

struct PantallaPublicacion: View {
    var id: Int
    @Environment(ControladorGeneral.self) var controlador
    
    var body: some View {
        ZStack {
            // Fondo
            Color("fondo")
                .ignoresSafeArea()
            
            VStack {
                // Título
                ZStack {
                    Color("texto_1")
                        .frame(height: 80)

                    
                    Text("Publicación")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                }
                
                Spacer(minLength: 20)
                
                if controlador.publicacion == nil {
                    switch controlador.estado {
                        
                    case .descargando_publicacion:
                        Spacer()
                        ProgressView("Descargando los datos...")
                            .font(.title2)
                            .scaleEffect(1.1)
                            .foregroundColor(Color("texto_2"))
                        Spacer()
                        
                    case .en_espera:
                        Text("Preparando la descarga...")
                            .foregroundColor(Color("texto_2"))
                            .onAppear {
                                controlador.descargar_publicacion(id: id)
                            }
                        
                    case .error_en_descarga:
                        Text("Existe un error en la descarga")
                            .foregroundColor(.red)
                        
                    default:
                        Text("Si ves esto, puedes mostrar esta pantalla por una galleta.")
                            .foregroundColor(Color("texto_2"))
                    }
                } else {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            
                            // Publicación principal estilo Facebook
                            VStack(alignment: .leading, spacing: 12) {
                                
                                // Título
                                HStack(alignment: .center, spacing: 12) {
                                    Image("usuario")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                        .shadow(radius: 2)
                                    
                                    Text(controlador.publicacion?.title ?? "")
                                        .font(.headline)
                                        .foregroundColor(Color("texto_1"))
                                        .lineLimit(2)
                                        .multilineTextAlignment(.leading)
                                }
                                
                                // Cuerpo de la publicación
                                Text(controlador.publicacion?.body ?? "")
                                    .font(.body)
                                    .foregroundColor(Color("texto_2"))
                                    .multilineTextAlignment(.leading)
                                
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color("publicacion"))
                            .cornerRadius(16)
                            .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 3)
                            
                            // Línea separadora
                            Divider()
                                .background(Color.gray.opacity(0.4))
                            
                            // Subtítulo comentarios
                            Text("Comentarios")
                                .font(.headline)
                                .foregroundColor(Color("texto_1"))
                                .padding(.bottom, 4)
                            
                            // Comentarios
                            if let comentarios = controlador.publicacion?.comentarios {
                                VStack(alignment: .leading, spacing: 12) {
                                    ForEach(comentarios) { comentario in
                                        VStack(alignment: .leading, spacing: 6) {
                                            
                                            HStack(alignment: .center, spacing: 12) {
                                                Image("usuario")
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 40, height: 40)
                                                    .clipShape(Circle())
                                                    .shadow(radius: 2)
                                                
                                                Text("Escrito por: \(comentario.name)")
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.gray)
                                                    .lineLimit(2)
                                                    .multilineTextAlignment(.leading)
                                            }
                                            Text(comentario.body)
                                                .foregroundColor(Color("texto_2"))
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .background(Color("tarjeta"))
                                        .cornerRadius(12)
                                        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    PantallaPublicacion(id: 2)
        .environment(ControladorGeneral())
}
