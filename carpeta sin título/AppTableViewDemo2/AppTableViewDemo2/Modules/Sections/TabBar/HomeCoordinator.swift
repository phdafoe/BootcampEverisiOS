//
//  HomeCoordinator.swift
//  AppTableViewDemo2
//
//  Created by Andres Felipe Ocampo Eljaiek on 29/7/21.
//

import Foundation
import UIKit

final class HomeCoordinator {
    
    static func view() -> HomeViewController {
        let vc = HomeViewController()
        
        let vcListaCoor = ListaCochesCoordinator.navigation()
        let vcPerfilCoor = PerfilCoordinator.navigation()
        
        vc.viewControllers = [vcListaCoor, vcPerfilCoor]
        
        return vc
    }

}
