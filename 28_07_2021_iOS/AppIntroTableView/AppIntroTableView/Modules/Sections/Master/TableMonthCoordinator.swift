//
//  TableMonthCoordinator.swift
//  AppIntroTableView
//
//  Created by Andres Felipe Ocampo Eljaiek on 28/7/21.
//

import Foundation
import UIKit

final class TableMonthCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> TableMonthViewController {
        TableMonthViewController()
    }
}
