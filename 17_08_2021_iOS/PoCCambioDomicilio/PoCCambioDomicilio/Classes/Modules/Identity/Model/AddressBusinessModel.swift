//
//  AddressBusinessModel.swift
//  PoCCambioDomicilio
//
//  Created by Andres Felipe Ocampo Eljaiek on 17/8/21.
//

import Foundation

struct AddressBusinessModel {
    let transmisiones: DRTransmisionesViewModel?
}

struct DRTransmisionesViewModel {
    let transmisionDatos: [DRTransmisionDatoViewModel]?
}

struct DRTransmisionDatoViewModel {
    let direccion: String?
    let municipioRespuesta: String?
}

