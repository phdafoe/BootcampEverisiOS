//
//  IndetityModel.swift
//  PoCCambioDomicilio
//
//  Created by Raúl Pascual de la Calle on 13/8/21.
//

import Foundation

//ConsultaIdentidad

// MARK: - IdentityModel
struct IdentityServerModel: Codable {
    let atributos: Atributos?
    let transmisiones: Transmisiones?

    enum CodingKeys: String, CodingKey {
        case atributos = "atributos"
        case transmisiones = "transmisiones"
    }
}

// MARK: - Atributos
struct Atributos: Codable {
    let idPeticion: String?
    let numElementos: Int?
    let timeStamp: String?
    let estado: AtributosEstado?
    let codigoCertificado: String?

    enum CodingKeys: String, CodingKey {
        case idPeticion = "idPeticion"
        case numElementos = "numElementos"
        case timeStamp = "timeStamp"
        case estado = "estado"
        case codigoCertificado = "codigoCertificado"
    }
}

// MARK: - AtributosEstado
struct AtributosEstado: Codable {
    let codigoEstado: String?
    let codigoEstadoSecundario: String?
    let literalError: String?
    let tiempoEstimadoRespuesta: Int?

    enum CodingKeys: String, CodingKey {
        case codigoEstado = "codigoEstado"
        case codigoEstadoSecundario = "codigoEstadoSecundario"
        case literalError = "literalError"
        case tiempoEstimadoRespuesta = "tiempoEstimadoRespuesta"
    }
}

// MARK: - Transmisiones
struct Transmisiones: Codable {
    let transmisionDatos: [TransmisionDato]?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case transmisionDatos = "transmisionDatos"
        case id = "id"
    }
}

// MARK: - TransmisionDato
struct TransmisionDato: Codable {
    let datosGenericos: DatosGenericos?
    let datosEspecificos: DatosEspecificos?

    enum CodingKeys: String, CodingKey {
        case datosGenericos = "datosGenericos"
        case datosEspecificos = "datosEspecificos"
    }
}

// MARK: - DatosEspecificos
struct DatosEspecificos: Codable {
    let consulta: String?
    let retorno: Retorno?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case consulta = "consulta"
        case retorno = "retorno"
        case id = "id"
    }
}

// MARK: - Retorno
struct Retorno: Codable {
    let estado: RetornoEstado?
    let datosTitular: DatosTitular?
    let dninacionalizado: String?

    enum CodingKeys: String, CodingKey {
        case estado = "estado"
        case datosTitular = "datosTitular"
        case dninacionalizado = "dninacionalizado"
    }
}

// MARK: - DatosTitular
struct DatosTitular: Codable {
    let numeroSoporte: String?
    let nombre: String?
    let apellido1: String?
    let apellido2: String?
    let nacionalidad: String?
    let sexo: String?
    let datosNacimiento: DatosNacimiento?
    let nombrePadre: String?
    let nombreMadre: String?
    let fechaCaducidad: String?

    enum CodingKeys: String, CodingKey {
        case numeroSoporte = "numeroSoporte"
        case nombre = "nombre"
        case apellido1 = "apellido1"
        case apellido2 = "apellido2"
        case nacionalidad = "nacionalidad"
        case sexo = "sexo"
        case datosNacimiento = "datosNacimiento"
        case nombrePadre = "nombrePadre"
        case nombreMadre = "nombreMadre"
        case fechaCaducidad = "fechaCaducidad"
    }
}

// MARK: - DatosNacimiento
struct DatosNacimiento: Codable {
    let fecha: String?
    let localidad: String?
    let provincia: String?

    enum CodingKeys: String, CodingKey {
        case fecha = "fecha"
        case localidad = "localidad"
        case provincia = "provincia"
    }
}

// MARK: - RetornoEstado
struct RetornoEstado: Codable {
    let codigoEstado: String?
    let codigoEstadoSecundario: String?
    let literalError: String?

    enum CodingKeys: String, CodingKey {
        case codigoEstado = "codigoEstado"
        case codigoEstadoSecundario = "codigoEstadoSecundario"
        case literalError = "literalError"
    }
}

// MARK: - DatosGenericos
struct DatosGenericos: Codable {
    let emisor: Emisor?
    let solicitante: Solicitante?
    let titular: Titular?
    let transmision: Transmision?

    enum CodingKeys: String, CodingKey {
        case emisor = "emisor"
        case solicitante = "solicitante"
        case titular = "titular"
        case transmision = "transmision"
    }
}

// MARK: - Emisor
struct Emisor: Codable {
    let nifEmisor: String?
    let nombreEmisor: String?

    enum CodingKeys: String, CodingKey {
        case nifEmisor = "nifEmisor"
        case nombreEmisor = "nombreEmisor"
    }
}

// MARK: - Solicitante
struct Solicitante: Codable {
    let identificadorSolicitante: String?
    let nombreSolicitante: String?
    let unidadTramitadora: String?
    let procedimiento: Procedimiento?
    let finalidad: String?
    let consentimiento: String?
    let funcionario: Funcionario?
    let idExpediente: String?

    enum CodingKeys: String, CodingKey {
        case identificadorSolicitante = "identificadorSolicitante"
        case nombreSolicitante = "nombreSolicitante"
        case unidadTramitadora = "unidadTramitadora"
        case procedimiento = "procedimiento"
        case finalidad = "finalidad"
        case consentimiento = "consentimiento"
        case funcionario = "funcionario"
        case idExpediente = "idExpediente"
    }
}

// MARK: - Funcionario
struct Funcionario: Codable {
    let nombreCompletoFuncionario: String?
    let nifFuncionario: String?

    enum CodingKeys: String, CodingKey {
        case nombreCompletoFuncionario = "nombreCompletoFuncionario"
        case nifFuncionario = "nifFuncionario"
    }
}

// MARK: - Procedimiento
struct Procedimiento: Codable {
    let codProcedimiento: String?
    let nombreProcedimiento: String?

    enum CodingKeys: String, CodingKey {
        case codProcedimiento = "codProcedimiento"
        case nombreProcedimiento = "nombreProcedimiento"
    }
}

// MARK: - Titular
struct Titular: Codable {
    let tipoDocumentacion: String?
    let documentacion: String?
    let nombreCompleto: String?
    let nombre: String?
    let apellido1: String?
    let apellido2: String?

    enum CodingKeys: String, CodingKey {
        case tipoDocumentacion = "tipoDocumentacion"
        case documentacion = "documentacion"
        case nombreCompleto = "nombreCompleto"
        case nombre = "nombre"
        case apellido1 = "apellido1"
        case apellido2 = "apellido2"
    }
}

// MARK: - Transmision
struct Transmision: Codable {
    let codigoCertificado: String?
    let idSolicitud: String?
    let idTransmision: String?
    let fechaGeneracion: String?

    enum CodingKeys: String, CodingKey {
        case codigoCertificado = "codigoCertificado"
        case idSolicitud = "idSolicitud"
        case idTransmision = "idTransmision"
        case fechaGeneracion = "fechaGeneracion"
    }
}

