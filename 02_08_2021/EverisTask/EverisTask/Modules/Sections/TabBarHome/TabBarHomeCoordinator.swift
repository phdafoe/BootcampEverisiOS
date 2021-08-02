//
//  TabBarHomeCoordinator.swift
//  EverisTask
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/8/21.
//

import Foundation
import UIKit

final class TabBarHomeCoordinator {
    
    static func view() -> TabBarHomeViewController {
        
        let tbVC = TabBarHomeViewController()
        
        let listaVC = ListaContactosCoordinator.navigation()
        let customButton = UITabBarItem(title: "Mis Contactos",
                                        image: UIImage(named: "TRIFECA_0M")?.withRenderingMode(.alwaysOriginal),
                                        selectedImage: UIImage(named: "TRIFECA_0M"))
        listaVC.tabBarItem = customButton
        
        tbVC.viewControllers = [listaVC]
        
        return tbVC
    }
}
