//
//  LIstaContactosRouter.swift
//  EverisTask
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/8/21.
//

import Foundation

protocol LIstaContactosRouterProtocol {
    func showDetail(dto: ArrayContact)
}

final class LIstaContactosRouter {
    
    let vc: LIstaContactosViewController?
    
    init(vc: LIstaContactosViewController) {
        self.vc = vc
    }
  
}

extension LIstaContactosRouter: LIstaContactosRouterProtocol{
    func showDetail(dto: ArrayContact) {
        DispatchQueue.main.async {
            self.vc?.navigationController?.pushViewController(DetalleContactoCoordinator.view(dto: DetalleContactoCoordinatorDTO(modelData: dto)), animated: true)
        }
    }
}
