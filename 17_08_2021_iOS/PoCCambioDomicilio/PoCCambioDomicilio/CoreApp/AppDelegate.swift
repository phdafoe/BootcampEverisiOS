//
//  AppDelegate.swift
//  PoCCambioDomicilio
//
//  Created by Raúl Pascual de la Calle on 13/8/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appCoordinator: AppCoordinatorProtocol = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        if let windowDes = window{
            appCoordinator.initialViewController(window: windowDes)
        }
        return true
    }

  


}

