//
//  DetalleContactoPresenter.swift
//  EverisTask
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/8/21.
//

import Foundation

protocol DetalleContactoPresenterProtocol {
    
}

final class DetalleContactoPresenter {
    
    var modelData: ArrayContact?
    
    let vc: DetalleContactoViewController?
    
    init(vc: DetalleContactoViewController) {
        self.vc = vc
    }
    
}

extension DetalleContactoPresenter: DetalleContactoPresenterProtocol{
    
}
