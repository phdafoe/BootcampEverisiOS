//
//  NuevaTareaCoordinator.swift
//  EverisTask
//
//  Created by Andres Felipe Ocampo Eljaiek on 4/8/21.
//

import Foundation
import UIKit

final class NuevaTareaCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> NuevaTareaViewController {
        let vc = NuevaTareaViewController()
        return vc
    }

}
