//
//  SplashPresenter.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/8/21.
//

import Foundation

protocol SplashPresenterProtocol {
    func fetchDataFromPresent()
    func numberOfRowInsection() -> Int
    func informationForCell(indexPath: Int) -> CardViewModel?
}

protocol SplashInteractorOutputProtocol {
    func getDataFromBusiness(data: [CardViewModel]?)
}

class SplashPresenter: BasePresenter<SplashViewControllerProtocol, SplashRouterProtocol, SplashInteractorProtocol>{
    var arrayData: [CardViewModel] = []
}

extension SplashPresenter: SplashPresenterProtocol{
    func fetchDataFromPresent() {
        self.interactor?.fetchData()
    }
    
    func numberOfRowInsection() -> Int {
        arrayData.count
    }
    
    func informationForCell(indexPath: Int) -> CardViewModel? {
        arrayData[indexPath]
    }
}

extension SplashPresenter: SplashInteractorOutputProtocol{
    func getDataFromBusiness(data: [CardViewModel]?) {
        if let dataDes = data{
            self.arrayData = dataDes
            self.vc?.reloadInformationInView()
        }
    }
}
