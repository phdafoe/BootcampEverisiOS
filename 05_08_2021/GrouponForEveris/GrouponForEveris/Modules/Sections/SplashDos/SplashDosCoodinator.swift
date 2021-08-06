//
//  SplashDosCoodinator.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 6/8/21.
//

import Foundation
import UIKit

// MARK: - module builder

final class SplashDosCoodinator: ModuleInterface {

    typealias View = SplashDosViewController
    typealias Presenter = SplashDosPresenter
    typealias Router = SplashDosRouter
    typealias Interactor = SplashDosInteractor
    
    func navigation() -> UINavigationController {
        UINavigationController(rootViewController: build())
    }

    func build() -> UIViewController {
        let view = View()
        let interactor = Interactor()
        let presenter = Presenter()
        let router = Router()
        self.coordinator(view: view, presenter: presenter, router: router, interactor: interactor)
        router.viewController = view
        return view
    }
}
