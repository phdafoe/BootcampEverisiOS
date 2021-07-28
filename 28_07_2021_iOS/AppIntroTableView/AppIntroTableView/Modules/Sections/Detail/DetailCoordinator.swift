//
//  DetailCoordinator.swift
//  AppIntroTableView
//
//  Created by Andres Felipe Ocampo Eljaiek on 28/7/21.
//

import Foundation
import UIKit

final class DetailCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view(dto: DetailCoordinatorDTO? = nil) -> DetailViewController {
        let vc = DetailViewController()
        vc.nameMonth = dto?.nameMonth ?? ""
        return vc
    }
}

struct DetailCoordinatorDTO {
    var nameMonth: String?
}
