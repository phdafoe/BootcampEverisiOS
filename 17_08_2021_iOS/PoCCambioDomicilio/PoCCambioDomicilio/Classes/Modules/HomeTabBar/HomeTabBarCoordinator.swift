//
//  HomeTabBarCoordinator.swift
//  PoCCambioDomicilio
//
//  Created by Raúl Pascual de la Calle on 13/8/21.
//

import Foundation
import UIKit

final class HomeTabBarCoordinator {
    
    
    
    static func homeTabBar(dto: HomeTabBarCoordinatorDTO? = nil) -> HomeTabBarViewController {
        
        let homeTabViewController = HomeTabBarViewController(nibName: HomeTabBarViewController.defaultReuseIdentifierViewController, bundle: nil)
        
        
        //Elemento 1 (inicio)
        let inicio = IndentityCoordinator().navigation()
        let boton1 = UITabBarItem(title: "Inicio", image: UIImage(named: "logo_060"), selectedImage: UIImage(named: "logo_060"))
        inicio.tabBarItem = boton1
        
        
        //Elemento 2 (Contacto)
        let contacto = ContactoCoordinator().navigation()
        let boton2 = UITabBarItem(title: "Contacto", image: UIImage(named: "Contact"), selectedImage: UIImage(named: "Contact"))
        contacto.tabBarItem = boton2
        
        
        //Elemento 3 (Ayuda)
        let ayuda = AyudaCoordinator().navigation()
        let boton3 = UITabBarItem(title: "Ayuda", image: UIImage(systemName: "questionmark.circle"), selectedImage: UIImage(systemName: "questionmark.circle"))
        ayuda.tabBarItem = boton3
        
        homeTabViewController.viewControllers = [inicio, contacto, ayuda]
        return homeTabViewController
    }
}

struct HomeTabBarCoordinatorDTO {
  
}
