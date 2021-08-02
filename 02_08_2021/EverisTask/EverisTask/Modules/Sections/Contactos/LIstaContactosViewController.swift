//
//  LIstaContactosViewController.swift
//  EverisTask
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/8/21.
//

import UIKit

protocol LIstaContactosViewControllerProtocol {
    func reloadDataInView()
}

class LIstaContactosViewController: UIViewController {
    
    // MARK: - ID
    var presenter: ListaContactosPresenterProtocol?
    
    @IBOutlet weak var listaContactosTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoadInPresente()
        self.setupTableView()
        // Do any additional setup after loading the view.
    }
   
    
    private func setupTableView() {
        self.listaContactosTableView.delegate = self
        self.listaContactosTableView.dataSource = self
        self.listaContactosTableView.register(UINib(nibName: "ContactosCell", bundle: nil), forCellReuseIdentifier: "ContactosCell")
    }


}

extension LIstaContactosViewController: LIstaContactosViewControllerProtocol{
    
    func reloadDataInView() {
        self.listaContactosTableView.reloadData()
    }
}

extension LIstaContactosViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numnberOFRowInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellContactos = self.listaContactosTableView.dequeueReusableCell(withIdentifier: "ContactosCell", for: indexPath) as! ContactosCell
        if let modelData = self.presenter?.informationCell(indexPath: indexPath.row){
            cellContactos.ceonfigCell(data: modelData)
        }
        return cellContactos
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let modelData = self.presenter?.informationCell(indexPath: indexPath.row){
            self.presenter?.showDetailContacto(dto: modelData)
        }
    }
}
