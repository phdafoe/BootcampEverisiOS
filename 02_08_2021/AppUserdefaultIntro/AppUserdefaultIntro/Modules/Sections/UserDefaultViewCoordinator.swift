//
//  UserDefaultViewCoordinator.swift
//  AppUserdefaultIntro
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/8/21.
//

import Foundation
import UIKit

final class UserDefaultViewCoordinator{
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> UserDefaultViewController {
        UserDefaultViewController()
    }
}
