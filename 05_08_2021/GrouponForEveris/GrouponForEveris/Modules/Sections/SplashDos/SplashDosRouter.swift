//
//  SplashDosRouter.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 6/8/21.
//

import Foundation
import UIKit

protocol SplashDosRouterPresenterInterface: RouterPresenterInterface {
    func showHomeTabBar(data: [CardBusinessModel])
}

final class SplashDosRouter: RouterInterface {
    
    weak var presenter: SplashDosPresenterRouterInterface!
    weak var viewController: UIViewController?
    
}

extension SplashDosRouter: SplashDosRouterPresenterInterface {
    func showHomeTabBar(data: [CardBusinessModel]) {
        DispatchQueue.main.async {
            let vc = HomeTabBarCoordinator.homeTabBar(dto: data)
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            self.viewController?.present(vc, animated: true, completion: nil)
        }
    }
}
