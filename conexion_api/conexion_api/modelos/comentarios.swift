//
//  comentarios.swift
//  conexion_api
//
//  Created by alumno on 3/18/26.
//

struct Comentario: Identifiable, Codable{
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
