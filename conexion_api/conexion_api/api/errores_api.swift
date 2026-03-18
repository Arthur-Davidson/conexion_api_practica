//
//  errores_api.swift
//  conexion_api
//
//  Created by alumno on 3/13/26.
//

enum ErroresAPI: Error {
    case url_mal_escrita
    case peticion_invalida
    case respuesta_erronea
    case codigo_respuesta_erronea
    case falla_en_la_codificacion
}
