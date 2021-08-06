//
//  SplashDosRouter.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 6/8/21.
//

import Foundation
import UIKit

protocol SplashDosRouterPresenterInterface: RouterPresenterInterface {

}

final class SplashDosRouter: RouterInterface {
    
    
    weak var presenter: SplashDosPresenterRouterInterface!
    weak var viewController: UIViewController?
}

extension SplashDosRouter: SplashDosRouterPresenterInterface {
    
}
