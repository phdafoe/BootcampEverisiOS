//
//  AppCoordinator.swift
//  PoCCambioDomicilio
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/8/21.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
    func initialViewController(window: UIWindow)
}

final class AppCoordinator: AppCoordinatorProtocol{
    
    private var initialVC = UIViewController()
    
    func initialViewController(window: UIWindow) {
        self.initialVC = LoginCoordinator().build()
        window.rootViewController = self.initialVC
        window.makeKeyAndVisible()
    }
    
    static let defaultHTTPHeader: [String: String] = {
        return ["Content-Type": "application/json"]
    }()
}
