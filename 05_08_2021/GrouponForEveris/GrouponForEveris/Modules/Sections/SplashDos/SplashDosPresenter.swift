//
//  SplashDosPresenter.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 6/8/21.
//

import Foundation

protocol SplashDosPresenterRouterInterface: PresenterRouterInterface {

}

protocol SplashDosPresenterInteractorInterface: PresenterInteractorInterface {

}

protocol SplashDosPresenterViewInterface: PresenterViewInterface {

}

final class SplashDosPresenter: PresenterInterface {
    
    var router: SplashDosRouterPresenterInterface!
    var interactor: SplashDosInteractorPresenterInterface!
    weak var view: SplashDosViewPresenterInterface!
    
}

extension SplashDosPresenter: SplashDosPresenterRouterInterface {

}

extension SplashDosPresenter: SplashDosPresenterInteractorInterface {

}

extension SplashDosPresenter: SplashDosPresenterViewInterface {

}
