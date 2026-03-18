//
//  conexion_api.swift
//  conexion_api
//
//  Created by alumno on 3/13/26.
//
import Foundation

class ServicioAPI{
    static func descargar_informacion<Tipo: Codable>(desde: String) async -> Tipo? {
        do {
            guard let url = URL(string: desde) else { throw ErroresAPI.url_mal_escrita }
            
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            
            guard let respuesta = respuesta as? HTTPURLResponse else { throw ErroresAPI.respuesta_erronea }
            
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else { throw ErroresAPI.codigo_respuesta_erronea }
            
            guard let datos_descodificados = try? JSONDecoder().decode(Tipo.self, from: datos) else { throw ErroresAPI.falla_en_la_codificacion }
            
            return datos_descodificados;
            
        }
        
        catch ErroresAPI.respuesta_erronea{
            print("\(#function) Error: Respuesta erronea. Por favor revisa")
        }
        
        catch ErroresAPI.url_mal_escrita {
            print("\(#function) Error: URL mal escrita. Por favor revisa")
        }
        
        catch ErroresAPI.codigo_respuesta_erronea {
            print("\(#function) Error: Codigo de estado erroneo. Por favor revisa")
        }
        
        catch ErroresAPI.peticion_invalida{
            print("\(#function) Error: Peticion de datos invalida. Por favor revisa")
        }
        
        catch ErroresAPI.falla_en_la_codificacion{
            print("\(#function) Error: el tipo de dato \(Tipo.self) tiene campos erroneos. Por favor revisa")
        }
        
        catch {
            print("\(#function) ERROR: Un error ha sido identificado, y no sabemos cual es.")
        }
        
        return nil
    }
}
