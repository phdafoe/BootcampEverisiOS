//
//  ListaContactosPresenter.swift
//  EverisTask
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/8/21.
//

import Foundation

protocol ListaContactosPresenterProtocol {
    func viewDidLoadInPresente()
    func numnberOFRowInSection() -> Int
    func informationCell(indexPath: Int) -> ArrayContact
    func showDetailContacto(dto: ArrayContact)
}


final class ListaContactosPresenter {
    
    // MARK: - Variables
    var arrayContactos: [ArrayContact] = []
    let vc: LIstaContactosViewController?
    var router: LIstaContactosRouterProtocol?
    
    init(vc: LIstaContactosViewController) {
        self.vc = vc
    }

}

extension ListaContactosPresenter: ListaContactosPresenterProtocol {
    func viewDidLoadInPresente() {
        if let model = ContactosModel.stubbedContacts {
            self.arrayContactos = model
            self.vc?.reloadDataInView()
        }
    }
    
    func numnberOFRowInSection() -> Int {
        return self.arrayContactos.count
    }
    
    func informationCell(indexPath: Int) -> ArrayContact {
        return arrayContactos[indexPath]
    }
    
    func showDetailContacto(dto: ArrayContact) {
        self.router?.showDetail(dto: dto)
    }
}
