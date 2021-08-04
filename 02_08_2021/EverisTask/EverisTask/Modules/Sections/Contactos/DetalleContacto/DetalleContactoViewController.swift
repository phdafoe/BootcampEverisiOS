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
        self.detalleContactosTableView.register(UINib(nibName: "DetallePerfilCell", bundle: nil), forCellReuseIdentifier: "DetallePerfilCell")
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
        let cellContactos = self.detalleContactosTableView.dequeueReusableCell(withIdentifier: "DetallePerfilCell", for: indexPath) as! DetallePerfilCell
        if let modelData = self.presenter?.informationData(){
            cellContactos.configCell(model: modelData)
        }
        return cellContactos
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        UITableView.automaticDimension
    }
    
}


