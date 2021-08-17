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

protocol IndentityPresenterRouterInterface: PresenterRouterInterface {
    
}

protocol IndentityPresenterInteractorInterface: PresenterInteractorInterface {
    func getDataProfileView(data: ProfileViewModel)
}

protocol IndentityPresenterViewInterface: PresenterViewInterface {
    func fetchDataIdentity()
    func showMessageMoreInfoProfile()
    var dataCellModel: IdentityCellModel? { get set }
}

final class IndentityPresenter: PresenterInterface {
    
    var router: IndentityRouterPresenterInterface!
    var interactor: IndentityInteractorPresenterInterface!
    weak var view: IndentityViewPresenterInterface!
    

    var dataCellModel: IdentityCellModel?
    
}

extension IndentityPresenter: IndentityPresenterRouterInterface {
    
}

extension IndentityPresenter: IndentityPresenterInteractorInterface {
    
    func getDataProfileView(data: ProfileViewModel) {
        self.dataCellModel = IdentityCellModel(photo: nil,
                                               greeting: "Hola",
                                               name: data.name,
                                               lastUpdate: data.lastUpdate,
                                               lastNamePlaceholder: "Apellidos",
                                               lastNameData: data.lastName,
                                               identityDocPlaceholder: "NIF",
                                               identityData: data.identityDoc,
                                               validityPlaceholder: "Validez",
                                               validityData: data.validityData,
                                               addressPlaceholder: "DomicilioEmpadronado",
                                               addressData: data.addressData,
                                               cityPlaceholder: "Ciudad",
                                               cityData: data.cityData)
        self.view.reloadInformationInView()
    }
    
}

extension IndentityPresenter: IndentityPresenterViewInterface {
    func fetchDataIdentity() {
        self.interactor.fetchDataIdentityInteractor()
    }
    
    func showMessageMoreInfoProfile() {
        self.router.showMessageMoreInfoProfile()
    }
    
    
    
}
