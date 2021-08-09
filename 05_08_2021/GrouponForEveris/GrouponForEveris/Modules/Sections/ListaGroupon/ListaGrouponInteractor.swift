/*
Copyright, everisSL
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import Foundation

protocol ListaGrouponInteractorPresenterInterface: InteractorPresenterInterface {
    func fetchDataFromInteractor()
}

final class ListaGrouponInteractor: InteractorInterface {
    
    weak var presenter: ListaGrouponPresenterInteractorInterface!
    let provider: ListaGrouponProviderProtocol = ListaGrouponProvider()
    
    
    // Esta es una base de transformacion de negocia para la Vista futura
    private func transformData(data: [Card]) -> [CardBusinessModel] {
        var arrayData: [CardBusinessModel] = []
        for index in 0..<data.count{
            let obj = CardBusinessModel(data: CardDataViewModel(isAutoRefundEnabled: data[index].data?.isAutoRefundEnabled ?? false))
            arrayData.append(obj)
        }
        return arrayData
    }
    
}

extension ListaGrouponInteractor: ListaGrouponInteractorPresenterInterface {
    func fetchDataFromInteractor() {
        provider.fetchData { [weak self] (result) in
            guard self != nil else { return }
            self?.presenter.getDataFromInteractor(data: self?.transformData(data: result.cards ?? []))
        } failure: { (error) in
            print(error)
        }

    }
}
