//
//  AppCoordinator.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/8/21.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
    func showInitialApp(window: UIWindow)
}

final class AppCoordinator: AppCoordinatorProtocol{
    
    private var initialVC = UIViewController()
    
    internal func showInitialApp(window: UIWindow){
        initialVC = SplashCoordinator.navigation()
        window.rootViewController = initialVC
        window.makeKeyAndVisible()
    }
    
    static let defaultHTTPHeader: [String: String] = {
        return ["Authorization": URLEndpoint.bearerHeroku]
    }()
}
