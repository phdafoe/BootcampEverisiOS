//
//  AppCoordinator.swift
//  AppIntroTableView
//
//  Created by Andres Felipe Ocampo Eljaiek on 28/7/21.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocolo {
    func showInitialVC(window: UIWindow)
}

final class AppCoordinator: AppCoordinatorProtocolo {
    
    private var initialViewController = UIViewController()
    
    internal func showInitialVC(window: UIWindow) {
        initialViewController = TableMonthCoordinator.navigation()
        window.rootViewController = initialViewController
        window.makeKeyAndVisible()
    }
}
