//
//  SplashDosInteractor.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 6/8/21.
//

import Foundation

protocol SplashDosInteractorPresenterInterface: InteractorPresenterInterface {
    func fetchDataFromInteractor()
}

final class SplashDosInteractor: InteractorInterface {
    
    weak var presenter: SplashDosPresenterInteractorInterface!
    let provider: SplashProviderProtocol = SplashProvider()
    
    
    private func transformData(data: [Card]) -> [CardBusinessModel] {
        var arrayData: [CardBusinessModel] = []
        for index in 0..<data.count{
            let obj = CardBusinessModel(data: CardDataViewModel(isAutoRefundEnabled: data[index].data?.isAutoRefundEnabled ?? false))
            arrayData.append(obj)
        }
        return arrayData
    }
    
}

extension SplashDosInteractor: SplashDosInteractorPresenterInterface {
    func fetchDataFromInteractor() {
        provider.fetchData { [weak self] (result) in
            guard self != nil else { return }
            self?.presenter.getDataFromInteractor(data: self?.transformData(data: result.cards ?? []))
        } failure: { (error) in
            //
        }

    }
}
