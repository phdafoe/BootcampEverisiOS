//
//  GenericWebViewViewCoordinator.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 11/8/21.
//

import Foundation
import UIKit

final class GenericWebViewViewCoordinator {
    
    static func build(dto: GenericWebViewViewCoordinatorDTO? = nil) -> UIViewController {
        let vc = GenericWebViewViewController()
        vc.url = dto?.url
        return vc
    }
}

struct GenericWebViewViewCoordinatorDTO{
    var url: String?
}
