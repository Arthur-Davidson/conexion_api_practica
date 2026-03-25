//
//  vista_publicacion.swift
//  conexion_api
//
//  Created by alumno on 3/23/26.
//

import SwiftUI

struct VistaPublicacion: View {
    var publicacion: Publicacion
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                // Tarjeta de publicación
                
                VStack(alignment: .leading, spacing: 12) {
                    
                    HStack{
                        
                        Image("usuario")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .shadow(radius: 2)
                        
                        VStack {
                            if let usuario = publicacion.usuario {
                                NavigationLink {
                                    PantallaUsuario(id: usuario.id)
                                } label: {
                                    MiniVistaUsuario(usuario: usuario)
                                }
                                .foregroundColor(Color("texto_2"))
                            } else {
                                Text("Error")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    
                    Text(publicacion.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("texto_1"))
                    
                    Text(publicacion.body)
                        .font(.body)
                        .foregroundColor(Color("texto_2"))
                        .multilineTextAlignment(.leading)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("publicacion"))
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 3)
                
                
                // Separador
                Divider()
                    .background(Color.gray.opacity(0.4))
                
                
                // Comentarios
                Text("Comentarios")
                    .font(.headline)
                    .foregroundColor(Color("texto_1"))
                
                VStack(spacing: 12) {
                    ForEach(publicacion.comentarios ?? []) { comentario in
                        
                        VStack(alignment: .leading, spacing: 8) {
                            VistaComentario(comentario: comentario)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color("tarjeta"))
                        .cornerRadius(12)
                        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    NavigationStack {
        PantallaPublicacion(id: 3)
            .environment(ControladorGeneral())
    }
}
