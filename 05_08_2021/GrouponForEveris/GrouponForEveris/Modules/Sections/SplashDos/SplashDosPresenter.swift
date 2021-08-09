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
    func getDataFromInteractor(data: [DataViewModel]?)
}

protocol SplashDosPresenterViewInterface: PresenterViewInterface {
    func fetchData()
}

final class SplashDosPresenter: PresenterInterface {
    
    var router: SplashDosRouterPresenterInterface!
    var interactor: SplashDosInteractorPresenterInterface!
    weak var view: SplashDosViewPresenterInterface!
    
    //var arrayData: [CardBusinessModel] = []
    
}

extension SplashDosPresenter: SplashDosPresenterRouterInterface {
    
}

extension SplashDosPresenter: SplashDosPresenterInteractorInterface {
    func getDataFromInteractor(data: [DataViewModel]?) {
        if let dataDes = data {
            self.router.showHomeTabBar(data: dataDes)
        }
    }
}

extension SplashDosPresenter: SplashDosPresenterViewInterface {
    func fetchData() {
        self.interactor.fetchDataFromInteractor()
    }
    
}
