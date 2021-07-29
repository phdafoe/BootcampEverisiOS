//
//  PerfilModel.swift
//  AppTableViewDemo2
//
//  Created by Andres Felipe Ocampo Eljaiek on 29/7/21.
//

import Foundation
import UIKit

struct PerfilModel {
    
    var imagePerfil: UIImage?
    var perfilTwitter: String?
    var nombre: String?
    var puestoTrabajo: String?
    var lugarVivo: String?
    var numeroSeguidores: Int?
}

struct PostModel {
    
    var perfil: PerfilModel?
    var tituloPosteo: String?
    var mensajePosteo: String?
    var fuentePosteo: String?
    var numeroLikes: Int?
    var numeroComentarios: Int?
    var horaPublicacion: Date?
    var imagenPost: UIImage?
    
}
