//
//  AddressServerModel.swift
//  PoCCambioDomicilio
//
//  Created by Andres Felipe Ocampo Eljaiek on 17/8/21.
//

import Foundation

// MARK: - DRAddressServerModel
struct AddressServerModel: Codable {
    let atributos: Atributos?
    let transmisiones: DRTransmisiones?

    enum CodingKeys: String, CodingKey {
        case atributos = "atributos"
        case transmisiones = "transmisiones"
    }
}

// MARK: - DRTransmisiones
struct DRTransmisiones: Codable {
    let transmisionDatos: [DRTransmisionDato]?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case transmisionDatos = "transmisionDatos"
        case id = "id"
    }
}

// MARK: - DRTransmisionDato
struct DRTransmisionDato: Codable {
    let datosGenericos: DatosGenericos?
    let datosEspecificos: DRDatosEspecificos?

    enum CodingKeys: String, CodingKey {
        case datosGenericos = "datosGenericos"
        case datosEspecificos = "datosEspecificos"
    }
}

// MARK: - DRDatosEspecificos
struct DRDatosEspecificos: Codable {
    let solicitud: String?
    let retorno: DRRetorno?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case solicitud = "solicitud"
        case retorno = "retorno"
        case id = "id"
    }
}

// MARK: - DRRetorno
struct DRRetorno: Codable {
    let estado: RetornoEstado?
    let fechaInscripcion: String?
    let domicilio: Domicilio?
    let origenDatos: String?

    enum CodingKeys: String, CodingKey {
        case estado = "estado"
        case fechaInscripcion = "fechaInscripcion"
        case domicilio = "domicilio"
        case origenDatos = "origenDatos"
    }
}

// MARK: - DRDomicilio
struct Domicilio: Codable {
    let provinciaRespuesta: EntColectiva?
    let municipioRespuesta: EntColectiva?
    let entColectiva: EntColectiva?
    let entSingular: EntColectiva?
    let nucleo: EntColectiva?
    let codUnidadPoblacional: String?
    let direccion: Direccion?
    let ultimaVariacion: UltimaVariacion?

    enum CodingKeys: String, CodingKey {
        case provinciaRespuesta = "provinciaRespuesta"
        case municipioRespuesta = "municipioRespuesta"
        case entColectiva = "entColectiva"
        case entSingular = "entSingular"
        case nucleo = "nucleo"
        case codUnidadPoblacional = "codUnidadPoblacional"
        case direccion = "direccion"
        case ultimaVariacion = "ultimaVariacion"
    }
}

// MARK: - DRDireccion
struct Direccion: Codable {
    let via: Via?
    let numero: Numero?
    let numeroSuperior: Numero?
    let kmt: String?
    let hmt: String?
    let bloque: String?
    let portal: String?
    let escalera: String?
    let planta: String?
    let puerta: String?
    let codPostal: String?
    let tipoLocal: String?

    enum CodingKeys: String, CodingKey {
        case via = "via"
        case numero = "numero"
        case numeroSuperior = "numeroSuperior"
        case kmt = "kmt"
        case hmt = "hmt"
        case bloque = "bloque"
        case portal = "portal"
        case escalera = "escalera"
        case planta = "planta"
        case puerta = "puerta"
        case codPostal = "codPostal"
        case tipoLocal = "tipoLocal"
    }
}

// MARK: - DRNumero
struct Numero: Codable {
    let calificador: String?
    let valor: String?

    enum CodingKeys: String, CodingKey {
        case calificador = "calificador"
        case valor = "valor"
    }
}

// MARK: - DRVia
struct Via: Codable {
    let codigo: String?
    let tipo: String?
    let nombre: String?
    let pseudovia: String?

    enum CodingKeys: String, CodingKey {
        case codigo = "codigo"
        case tipo = "tipo"
        case nombre = "nombre"
        case pseudovia = "pseudovia"
    }
}

// MARK: - DREntColectiva
struct EntColectiva: Codable {
    let codigo: String?
    let nombre: String?

    enum CodingKeys: String, CodingKey {
        case codigo = "codigo"
        case nombre = "nombre"
    }
}

// MARK: - DRUltimaVariacion
struct UltimaVariacion: Codable {
    let codigo: String?
    let descripcion: String?
    let fecha: String?

    enum CodingKeys: String, CodingKey {
        case codigo = "codigo"
        case descripcion = "descripcion"
        case fecha = "fecha"
    }
}


