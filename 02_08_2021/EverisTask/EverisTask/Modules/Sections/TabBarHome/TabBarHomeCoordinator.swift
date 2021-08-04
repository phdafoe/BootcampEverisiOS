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
        
        // 1
        let listaVC = ListaContactosCoordinator.navigation()
        let customButton = UITabBarItem(title: "Mis Contactos",
                                        image: UIImage(named: "TRIFECA_0M")?.withRenderingMode(.alwaysOriginal),
                                        selectedImage: UIImage(named: "TRIFECA_0M")?.withRenderingMode(.alwaysOriginal))
        listaVC.tabBarItem = customButton
        
        
        // 2
        let nuevaTareaVC = NuevaTareaCoordinator.navigation()
        let customButton2 = UITabBarItem(title: "Lista de Tareas",
                                        image: UIImage(named: "TRIFECA_1M")?.withRenderingMode(.alwaysOriginal),
                                        selectedImage: UIImage(named: "TRIFECA_1M")?.withRenderingMode(.alwaysOriginal))
        nuevaTareaVC.tabBarItem = customButton2
        
        // 2
        let listaTareaVC = ListaTareasViewController()
        let customButton3 = UITabBarItem(title: "Lista de Tareas",
                                        image: UIImage(named: "TRIFECA_2M")?.withRenderingMode(.alwaysOriginal),
                                        selectedImage: UIImage(named: "TRIFECA_2M")?.withRenderingMode(.alwaysOriginal))
        listaTareaVC.tabBarItem = customButton3
        
        
        
        tbVC.viewControllers = [listaVC, nuevaTareaVC, listaTareaVC]
        return tbVC
    }
}
