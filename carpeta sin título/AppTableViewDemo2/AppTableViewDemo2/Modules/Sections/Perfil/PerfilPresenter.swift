/*
Copyright, everisSL
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import Foundation
import UIKit

protocol PerfilPresenterProtocol {
    func viewDidLoad()
    func getDataCellForRowPost() -> Int
    func getInformationPerfilCell() -> PerfilModel?
    func getInformationForRowCell(indexPath: Int) -> PostModel
}

final class PerfilPresenter {
    
    //var arrayCoches: [CochesModel] = []
    let vc: PerfilViewController?
    
    var perfilModel: PerfilModel? = PerfilModel()
    var postsArrayModel: [PostModel] = []
    
    init(vc: PerfilViewController) {
        self.vc = vc
    }
    

}

extension PerfilPresenter: PerfilPresenterProtocol {
    
    func viewDidLoad(){
        self.getPerfilData()
        self.getArrayData()
        self.vc?.reloadData()
    }
    
    func getPerfilData() {
        perfilModel = PerfilModel(imagePerfil: UIImage(named: "thor"),
                                  perfilTwitter: "@twitterDeThorrrrlll",
                                  nombre: "Thor ll",
                                  puestoTrabajo: "Super martillo!",
                                  lugarVivo: "En la quinta dimensión",
                                  numeroSeguidores: 200)
    }
    
    func getArrayData() {
        postsArrayModel.removeAll()
        postsArrayModel = [PostModel(perfil: PerfilModel(imagePerfil: UIImage(named: "Miranda_Lambert"),
                                                        perfilTwitter: "@mirandaTwitter",
                                                        nombre: "Miranda Lambert",
                                                        puestoTrabajo: "Canante de American Idol",
                                                        lugarVivo: "Nueva York",
                                                        numeroSeguidores: 300),
                                    tituloPosteo: "Lorem ipsum es lo mejor parea imprimir texto falso",
                                    mensajePosteo: "Lorem ipsum es lo mejor parea imprimir texto falso, 'Lorem ipsum' es lo mejor parea imprimir texto falso \n Lorem ipsum es lo mejor parea imprimir texto falso, 'Lorem ipsum' es lo mejor parea imprimir texto falso \n \n Lorem ipsum es lo mejor parea imprimir texto falso, 'Lorem ipsum' es lo mejor parea imprimir texto falso, Lorem ipsum es lo mejor parea imprimir texto falso, 'Lorem ipsum' es lo mejor parea imprimir texto falso",
                                    fuentePosteo: "comics sans",
                                    numeroLikes: 100,
                                    numeroComentarios: 25,
                                    horaPublicacion: Date(),
                                    imagenPost: UIImage(named: "Miranda_Lambert")),
                           PostModel(perfil: PerfilModel(imagePerfil: UIImage(named: "Miranda_Lambert"),
                                                                                                                  perfilTwitter: "@mirandaTwitter",
                                                                                                                  nombre: "Miranda Lambert",
                                                                                                                  puestoTrabajo: "Canante de American Idol",
                                                                                                                  lugarVivo: "Nueva York",
                                                                                                                  numeroSeguidores: 300),
                                                                                              tituloPosteo: "Lorem ipsum es lo mejor parea imprimir texto falso",
                                                                                              mensajePosteo: "Lorem ipsum es lo mejor parea imprimir texto falso, 'Lorem ipsum' es lo mejor parea imprimir texto falso \n Lorem ipsum es lo mejor parea imprimir texto falso, 'Lorem ipsum' es lo mejor parea imprimir texto falso \n \n Lorem ipsum es lo mejor parea imprimir texto falso, 'Lorem ipsum' es lo mejor parea imprimir texto falso, Lorem ipsum es lo mejor parea imprimir texto falso, 'Lorem ipsum' es lo mejor parea imprimir texto falso",
                                                                                              fuentePosteo: "comics sans",
                                                                                              numeroLikes: 100,
                                                                                              numeroComentarios: 25,
                                                                                              horaPublicacion: Date(),
                                                                                              imagenPost: UIImage(named: "Miranda_Lambert")), PostModel(perfil: PerfilModel(imagePerfil: UIImage(named: "Miranda_Lambert"),
                                                                                                                                                                            perfilTwitter: "@mirandaTwitter",
                                                                                                                                                                            nombre: "Miranda Lambert",
                                                                                                                                                                            puestoTrabajo: "Canante de American Idol",
                                                                                                                                                                            lugarVivo: "Nueva York",
                                                                                                                                                                            numeroSeguidores: 300),
                                                                                                                                                        tituloPosteo: "Lorem ipsum es lo mejor parea imprimir texto falso",
                                                                                                                                                        mensajePosteo: "Lorem ipsum es lo mejor parea imprimir texto falso, 'Lorem ipsum' es lo mejor parea imprimir texto falso \n Lorem ipsum es lo mejor parea imprimir texto falso, 'Lorem ipsum' es lo mejor parea imprimir texto falso \n \n Lorem ipsum es lo mejor parea imprimir texto falso, 'Lorem ipsum' es lo mejor parea imprimir texto falso, Lorem ipsum es lo mejor parea imprimir texto falso, 'Lorem ipsum' es lo mejor parea imprimir texto falso",
                                                                                                                                                        fuentePosteo: "comics sans",
                                                                                                                                                        numeroLikes: 100,
                                                                                                                                                        numeroComentarios: 25,
                                                                                                                                                        horaPublicacion: Date(),
                                                                                                                                                        imagenPost: UIImage(named: "Miranda_Lambert")), PostModel(perfil: PerfilModel(imagePerfil: UIImage(named: "Miranda_Lambert"),
                                                                                                                                                                                                                                      perfilTwitter: "@mirandaTwitter",
                                                                                                                                                                                                                                      nombre: "Miranda Lambert",
                                                                                                                                                                                                                                      puestoTrabajo: "Canante de American Idol",
                                                                                                                                                                                                                                      lugarVivo: "Nueva York",
                                                                                                                                                                                                                                      numeroSeguidores: 300),
                                                                                                                                                                                                                  tituloPosteo: "Lorem ipsum es lo mejor parea imprimir texto falso",
                                                                                                                                                                                                                  mensajePosteo: "Lorem ipsum es lo mejor parea imprimir texto falso, 'Lorem ipsum' es lo mejor parea imprimir texto falso \n Lorem ipsum es lo mejor parea imprimir texto falso, 'Lorem ipsum' es lo mejor parea imprimir texto falso \n \n Lorem ipsum es lo mejor parea imprimir texto falso, 'Lorem ipsum' es lo mejor parea imprimir texto falso, Lorem ipsum es lo mejor parea imprimir texto falso, 'Lorem ipsum' es lo mejor parea imprimir texto falso",
                                                                                                                                                                                                                  fuentePosteo: "comics sans",
                                                                                                                                                                                                                  numeroLikes: 100,
                                                                                                                                                                                                                  numeroComentarios: 25,
                                                                                                                                                                                                                  horaPublicacion: Date(),
                                                                                                                                                                                                                  imagenPost: UIImage(named: "Miranda_Lambert"))]
    }
    
    func getDataCellForRowPost() -> Int {
        return postsArrayModel.count
    }
    
    func getInformationPerfilCell() -> PerfilModel? {
        return perfilModel
    }
    
    func getInformationForRowCell(indexPath: Int) -> PostModel{
        return postsArrayModel[indexPath]
    }
}
