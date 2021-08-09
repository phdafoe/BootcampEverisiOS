//
//  HomeTabBarCoordinator.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 9/8/21.
//

import Foundation
import UIKit

final class HomeTabBarCoordinator {
    
    static func homeTabBar(dto: [CardBusinessModel]? = nil) -> HomeTabBarViewController {
        
        let homeTabViewController = HomeTabBarViewController(nibName: HomeTabBarViewController.defaultReuseIdentifierViewController, bundle: nil)
        
        let listaVC = ListaGrouponCoordinator().navigation()
        let customButton = UITabBarItem(title: "Mis Contactos",
                                        image: UIImage(systemName: "house"),
                                        selectedImage: UIImage(systemName: "house"))
        listaVC.tabBarItem = customButton
        
                
        homeTabViewController.viewControllers = [listaVC]
        
        return homeTabViewController
    }
}

struct HomeTabBarCoordinatorDTO {
    var modelData: [CardBusinessModel]?
}
