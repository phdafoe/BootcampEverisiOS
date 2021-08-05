//
//  SplashCoordinator.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/8/21.
//

import Foundation

final class SplashCoordinator {
    
    static func navigation() -> BaseNavigation {
        BaseNavigation(rootViewController: view())
    }
    
    static func view() -> SplashViewController {
        let vc = SplashViewController(nibName: SplashViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: SplashViewController) -> SplashPresenterProtocol {
        let presenter = SplashPresenter(vc: vc, router: router(), interactor: interactor())
        return presenter
    }
    
    static func interactor() -> SplashInteractorProtocol {
        SplashInteractor()
    }
    
    static func router() -> SplashRouterProtocol {
        SplashRouter()
    }
    
}
