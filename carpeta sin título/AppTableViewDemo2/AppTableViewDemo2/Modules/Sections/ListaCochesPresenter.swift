//
//  ListaCochesPresenter.swift
//  AppTableViewDemo2
//
//  Created by Andres Felipe Ocampo Eljaiek on 29/7/21.
//

import Foundation
import UIKit

protocol ListaCochesPresenterProtocol {
    func setArrayData()
    func numberOfRowCell() -> Int
    func getInformationCellForRow(indexPath: Int) -> CochesModel
}

final class ListaCochesPresenter {
    
    var arrayCoches: [CochesModel] = []
    let vc: ListaCochesViewController?
    
    init(vc: ListaCochesViewController) {
        self.vc = vc
    }

}

extension ListaCochesPresenter: ListaCochesPresenterProtocol {
    
    func setArrayData() {
        self.arrayCoches.removeAll()
        self.arrayCoches = [CochesModel(name: "Audi", color: "Rojo", image: UIImage(named: "audi")),
                            CochesModel(name: "Renault", color: "Azul", image: UIImage(named: "audi")),
                            CochesModel(name: "VW", color: "Verde", image: UIImage(named: "audi")),
                            CochesModel(name: "Audi", color: "Rojo", image: UIImage(named: "audi")),
                            CochesModel(name: "Renault", color: "Azul", image: UIImage(named: "audi")),
                            CochesModel(name: "VW", color: "Verde", image: UIImage(named: "audi")),
                            CochesModel(name: "Audi", color: "Rojo", image: UIImage(named: "audi")),
                            CochesModel(name: "Renault", color: "Azul", image: UIImage(named: "audi")),
                            CochesModel(name: "VW", color: "Verde", image: UIImage(named: "audi"))]
        self.vc?.reloadData()
    }
    
    func numberOfRowCell() -> Int {
        return self.arrayCoches.count
    }
    
    func getInformationCellForRow(indexPath: Int) -> CochesModel {
        return self.arrayCoches[indexPath]
    }
}
