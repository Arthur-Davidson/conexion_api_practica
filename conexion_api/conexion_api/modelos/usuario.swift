//
//  usuario.swift
//  conexion_api
//
//  Created by alumno on 3/23/26.
//

struct Usuario: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String

    let phone: String
    let website: String
    
    let company: Compania
}
