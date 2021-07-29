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
}

final class ListaCochesPresenter {
    
    var arrayCoches = [CochesModel]()
    let vc: ListaCochesViewController?
    
    init(vc: ListaCochesViewController) {
        self.vc = vc
    }

}

extension ListaCochesPresenter: ListaCochesPresenterProtocol {
    
    func setArrayData() {
        
        self.arrayCoches = [CochesModel(name: "Audi", color: "Rojo", image: UIImage(named: "audi"))]
        self.vc?.reloadData()
    }
    
    func numberOfRowCell() -> Int {
        return self.arrayCoches.count
    }
}
