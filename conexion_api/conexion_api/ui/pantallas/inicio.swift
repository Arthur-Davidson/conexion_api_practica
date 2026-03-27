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
                    
                    // Header
                    ZStack {
                        Color("texto_1")
                            .frame(height: 100)
                        
                        VStack{
                            Text("Bienvenido a")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.white)
                            
                            Text("Grin Book")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                    
                    // Contenido según estado
                    switch(controlador.estado) {
                        
                    case .descargando_publicaciones:
                        Spacer()
                        VStack(spacing: 12) {
                            Image(systemName: "arrow.down.circle.fill")
                                .symbolEffect(.breathe)
                                .font(.largeTitle)
                                .foregroundColor(Color("texto_2"))
                            
                            Text("Cargando publicaciones...")
                                .foregroundColor(Color("texto_2"))
                        }
                        Spacer()
                        
                    case .en_espera:
                        ScrollView {
                            VStack(spacing: 16) {
                                
                                ForEach(controlador.publicaciones) { publicacion in
                                    
                                    NavigationLink {
                                        PantallaPublicacion(id: publicacion.id)
                                    } label: {
                                        
                                        VStack(alignment: .leading, spacing: 8) {
                                            
                                            HStack(spacing: 12) {
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
                                    
                                    /*
                                    .simultaneousGesture(
                                        TapGesture().onEnded {
                                            controlador.publicacion = nil
                                            controlador.descargar_publicacion(id: publicacion.id)
                                        }
                                    )
                                    */
                                }
                            }
                            .padding()
                        }
                        
                    case .descargando_publicacion:
                        Spacer()
                        Image(systemName: "arrowshape.down.circle")
                            .symbolEffect(.pulse)
                            .font(.largeTitle)
                            .foregroundColor(Color("texto_2"))
                        Spacer()
                        
                    case .error_en_descarga:
                        Spacer()
                        Text("ERROR: Asegurate de tener wifi!!!")
                            .foregroundColor(.red)
                            .font(.headline)
                        Spacer()
                    }
                }
            }
            .onAppear {
                controlador.descargar_publicaciones()
            }
        }
    }
}

#Preview {
    Inicio()
        .environment(ControladorGeneral())
}
