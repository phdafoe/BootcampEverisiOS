//
//  SplashInteractor.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/8/21.
//

import Foundation

protocol SplashInteractorProtocol {
    func fetchData()
}

class SplashInteractor: BaseInteractor<SplashInteractorOutputProtocol>{
    
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

extension SplashInteractor: SplashInteractorProtocol {
    func fetchData() {
        provider.fetchData { [weak self] (result) in
            guard self != nil else { return }
            self?.presenter?.getDataFromBusiness(data: self?.transformData(data: result.cards ?? []))
        } failure: { (error) in
            //
        }
    }
}
