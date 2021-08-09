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
    func getDataFromInteractor(data: [CardBusinessModel]?)
}

protocol SplashDosPresenterViewInterface: PresenterViewInterface {
    func fetchData()
}

final class SplashDosPresenter: PresenterInterface {
    
    var router: SplashDosRouterPresenterInterface!
    var interactor: SplashDosInteractorPresenterInterface!
    weak var view: SplashDosViewPresenterInterface!
    
    var arrayData: [CardBusinessModel] = []
    
}

extension SplashDosPresenter: SplashDosPresenterRouterInterface {
    
}

extension SplashDosPresenter: SplashDosPresenterInteractorInterface {
    func getDataFromInteractor(data: [CardBusinessModel]?) {
        if let dataDes = data{
            self.arrayData = dataDes
            self.view.reloadInformationInView()
        }
    }
}

extension SplashDosPresenter: SplashDosPresenterViewInterface {
    func fetchData() {
        self.interactor.fetchDataFromInteractor()
    }
    
}
