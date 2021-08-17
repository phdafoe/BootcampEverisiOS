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

protocol IndentityInteractorPresenterInterface: InteractorPresenterInterface {
   func fetchDataIdentityInteractor()
}

final class IndentityInteractor: InteractorInterface {
    
    weak var presenter: IndentityPresenterInteractorInterface!
    let provider: IndentityProviderProtocol = IndentityProvider()
    
    
    private func transformDataToIdentityBussinessModel(data: IdentityServerModel) -> IdentityBussinessModel? {
        var model: IdentityBussinessModel?
        model = IdentityBussinessModel(
            transmisiones: TransmisionesViewModel(
                transmisionDatos: [TransmisionDatoViewModel(
                                    datosGenericos: DatosGenericosViewModel(
                                        titular: TitularViewModel(
                                            tipoDocumentacion: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.tipoDocumentacion,
                                            documentacion: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.documentacion,
                                            nombreCompleto: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.nombreCompleto,
                                            nombre: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.nombre,
                                            apellido1: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.apellido1,
                                            apellido2: data.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.apellido2)),
                                    datosEspecificos: DatosEspecificosViewModel(
                                        retorno: RetornoViewModel(
                                            datosTitular: DatosTitularViewModel(
                                                fechaCaducidad: data.transmisiones?.transmisionDatos?[0].datosEspecificos?.retorno?.datosTitular?.fechaCaducidad))))]))
        return model
    }
    
    private func transformDataToAddressBusinessModel(data: AddressServerModel) -> AddressBusinessModel? {
        var model: AddressBusinessModel?
        model = AddressBusinessModel(
            transmisiones: DRTransmisionesViewModel(
                transmisionDatos: [DRTransmisionDatoViewModel(
                                    direccion: data.transmisiones?.transmisionDatos?[0].datosEspecificos?.retorno?.domicilio?.direccion?.via?.nombre,
                                    municipioRespuesta: data.transmisiones?.transmisionDatos?[0].datosEspecificos?.retorno?.domicilio?.municipioRespuesta?.nombre)]))
        return model
    }
    
    private func transformDataToProfileViewModel(identitySM: IdentityServerModel, addressSM: AddressServerModel) -> ProfileViewModel?{
        let identityBM = self.transformDataToIdentityBussinessModel(data: identitySM)
        let addressBM = self.transformDataToAddressBusinessModel(data: addressSM)
        
        var model: ProfileViewModel?
        model = ProfileViewModel(name: identityBM?.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.nombre,
                                 lastUpdate: identityBM?.transmisiones?.transmisionDatos?[0].datosEspecificos?.retorno?.datosTitular?.fechaCaducidad,
                                 lastName: identityBM?.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.apellido1,
                                 identityDoc: identityBM?.transmisiones?.transmisionDatos?[0].datosGenericos?.titular?.tipoDocumentacion,
                                 validityData: identityBM?.transmisiones?.transmisionDatos?[0].datosEspecificos?.retorno?.datosTitular?.fechaCaducidad,
                                 addressData: addressBM?.transmisiones?.transmisionDatos?[0].direccion,
                                 cityData: addressBM?.transmisiones?.transmisionDatos?[0].municipioRespuesta)
        return model
    }
    
}

extension IndentityInteractor: IndentityInteractorPresenterInterface {
    func fetchDataIdentityInteractor() {
        self.provider.fetchData { [weak self] (resultIdentityServerModel) in
            guard self != nil else { return }
            self?.provider.fetchDataAddress(completion: { [weak self] (resultAddressServerModel) in
                guard self != nil else { return }
                if let data = self?.transformDataToProfileViewModel(identitySM: resultIdentityServerModel, addressSM: resultAddressServerModel) {
                    self?.presenter.getDataProfileView(data: data)
                }
            }, failure: { (networkError) in
                //
            })
        } failure: { (networkError) in
            //
        }
    }
    
   
}
