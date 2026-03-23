//
//  publicacion.swift
//  conexion_api
//
//  Created by alumno on 3/13/26.
//

// Existen tres tipos de protocolos para convertir la informacion de JSON a datos validos para SwiftUI
// Decodable: Transformar de JSON a Swift
// Encodable: Transformar de Swift a JSON
// Codable: Las dos anteriores


struct Publicacion: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    var comentarios: [Comentario]?
    var usuario: Usuario?
}
