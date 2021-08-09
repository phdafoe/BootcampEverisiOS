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
    
    static func view() -> SplashViewController & SplashViewControllerProtocol {
        let vc = SplashViewController(nibName: SplashViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: SplashViewController) -> SplashPresenterProtocol & SplashInteractorOutputProtocol {
        let presenter = SplashPresenter(vc: vc)
        presenter.router = router()
        presenter.interactor = interactor(pre: presenter)
        return presenter
    }
    
    
    static func interactor(pre: SplashPresenter) -> SplashInteractorProtocol {
        let interactor = SplashInteractor(presenter: pre)
        return interactor
    }
    
    static func router() -> SplashRouterProtocol {
        SplashRouter()
    }
    
}
