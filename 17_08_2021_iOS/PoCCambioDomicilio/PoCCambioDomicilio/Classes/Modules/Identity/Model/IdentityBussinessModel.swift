//
//  IdentityBussinessModel.swift
//  PoCCambioDomicilio
//
//  Created by Andres Felipe Ocampo Eljaiek on 17/8/21.
//

import Foundation

struct IdentityBussinessModel {
    let transmisiones: TransmisionesViewModel?
}


struct TransmisionesViewModel {
    let transmisionDatos: [TransmisionDatoViewModel]?
}

struct TransmisionDatoViewModel {
    let datosGenericos: DatosGenericosViewModel?
    let datosEspecificos: DatosEspecificosViewModel?
}

struct DatosGenericosViewModel {
    let titular: TitularViewModel?
}


struct TitularViewModel {
    let tipoDocumentacion: String?
    let documentacion: String?
    let nombreCompleto: String?
    let nombre: String?
    let apellido1: String?
    let apellido2: String?
}

struct DatosEspecificosViewModel {
    let retorno: RetornoViewModel?
}

struct RetornoViewModel {
    let datosTitular: DatosTitularViewModel?
}

struct DatosTitularViewModel {
    let fechaCaducidad: String?
}


