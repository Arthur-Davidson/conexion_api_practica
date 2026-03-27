//
//  pantalla_comentario.swift
//  conexion_api
//
//  Created by alumno on 3/27/26.
//

import SwiftUI

struct PantallaComentarios: View {
    
    var comentarios: [Comentario]
    
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
                        
                        Text("Comentarios")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    // Lista de comentarios
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(comentarios) { comentario in
                                
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
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    PantallaComentarios(comentarios: [])
}
