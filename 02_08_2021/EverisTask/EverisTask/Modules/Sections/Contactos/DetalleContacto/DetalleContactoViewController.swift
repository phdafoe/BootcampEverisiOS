//
//  DetalleContactoViewController.swift
//  EverisTask
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/8/21.
//

import UIKit

protocol DetalleContactoViewControllerProtocol {
    func reloadDataModel()
}


class DetalleContactoViewController: UIViewController {
    
    // MARK: - ID
    var presenter: DetalleContactoPresenterProtocol?
    
    @IBOutlet weak var detalleContactosTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.getDataModel()
        self.setupTableView()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        self.detalleContactosTableView.delegate = self
        self.detalleContactosTableView.dataSource = self
        self.detalleContactosTableView.register(UINib(nibName: "ContactosCell", bundle: nil), forCellReuseIdentifier: "ContactosCell")
    }


}

extension DetalleContactoViewController: DetalleContactoViewControllerProtocol {
    func reloadDataModel(){
        self.detalleContactosTableView.reloadData()
    }
}

extension DetalleContactoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellContactos = self.detalleContactosTableView.dequeueReusableCell(withIdentifier: "ContactosCell", for: indexPath) as! ContactosCell
        if let modelData = self.presenter?.informationData(){
            cellContactos.ceonfigCell(data: modelData)
        }
        return cellContactos
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 70
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let modelData = self.presenter?.informationCell(indexPath: indexPath.row){
//            self.presenter?.showDetailContacto(dto: modelData)
//        }
//    }
}


