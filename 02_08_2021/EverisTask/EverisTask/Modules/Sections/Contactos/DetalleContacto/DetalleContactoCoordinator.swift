//
//  DetalleContactoCoordinator.swift
//  EverisTask
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/8/21.
//

import Foundation

final class DetalleContactoCoordinator {
    
    static func view(dto: DetalleContactoCoordinatorDTO? = nil) -> DetalleContactoViewController {
        let vc = DetalleContactoViewController()
        vc.presenter = presenter(vc: vc, dto: dto)
        return vc
    }
    
    private static func presenter(vc: DetalleContactoViewController, dto: DetalleContactoCoordinatorDTO? = nil) -> DetalleContactoPresenterProtocol {
        let presenter = DetalleContactoPresenter(vc: vc)
        presenter.modelData = dto?.modelData
        return presenter
    }
}

struct DetalleContactoCoordinatorDTO {
    var modelData: ArrayContact?
}
