//
//  AppCoordinator.swift
//  EverisTask
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/8/21.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
    func initialViewController(window: UIWindow)
}

final class AppCoordinator: AppCoordinatorProtocol {
    
    private var initialVC = UIViewController()
    
    internal func initialViewController(window: UIWindow){
        self.initialVC = TabBarHomeCoordinator.view()
        window.rootViewController = self.initialVC
        window.makeKeyAndVisible()
    }
    
}
