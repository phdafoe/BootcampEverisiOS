//
//  LIstaContactosCoordinator.swift
//  EverisTask
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/8/21.
//

import Foundation
import UIKit

final class ListaContactosCoordinator{
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> LIstaContactosViewController {
        let vc = LIstaContactosViewController()
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: LIstaContactosViewController) -> ListaContactosPresenterProtocol {
        let presenter = ListaContactosPresenter(vc: vc)
        presenter.router = router(vc: vc)
        return presenter
    }
    
    static func router(vc: LIstaContactosViewController) -> LIstaContactosRouterProtocol {
        let router = LIstaContactosRouter(vc: vc)
        return router
    }
}
