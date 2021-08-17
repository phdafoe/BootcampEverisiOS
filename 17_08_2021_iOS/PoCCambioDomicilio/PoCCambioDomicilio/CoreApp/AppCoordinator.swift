//
//  AppCoordinator.swift
//  PoCCambioDomicilio
//
//  Created by Raúl Pascual de la Calle on 13/8/21.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
    
    func initialViewController(window: UIWindow)
}
final class AppCoordinator: AppCoordinatorProtocol{
    
    private var initialVC = UIViewController()
    
    func initialViewController(window: UIWindow){
        self.customUI()
        self.initialVC = SplashCoordinator().build()
        window.rootViewController = self.initialVC
        window.makeKeyAndVisible()
    }
    
    static let defaultHTTPHeader: [String: String] = {
        return["Content-Type": "application/json"]
        
    }()
    
    private func customUI() {
        let navBar = UINavigationBar.appearance()
        let tabBar = UITabBar.appearance()
        
        navBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabBar.tintColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        navBar.barStyle = .default
        
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]
    }
    
}
