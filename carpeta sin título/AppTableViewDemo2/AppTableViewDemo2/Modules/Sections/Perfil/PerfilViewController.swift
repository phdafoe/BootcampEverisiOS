//
//  PerfilViewController.swift
//  AppTableViewDemo2
//
//  Created by Andres Felipe Ocampo Eljaiek on 29/7/21.
//

import UIKit

protocol PerfilViewControllerProtocol {
    func reloadData()
}


class PerfilViewController: UIViewController {
    
    // MARK: - ID
    var presenter: PerfilPresenterProtocol?
    
    @IBOutlet weak var myTableViewPerfil: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Perfil"
        self.presenter?.viewDidLoad()
        setupTableView()

        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        self.myTableViewPerfil.delegate = self
        self.myTableViewPerfil.dataSource = self
        self.myTableViewPerfil.register(UINib(nibName: "PerfilTableViewCell", bundle: nil), forCellReuseIdentifier: "PerfilTableViewCell")
        self.myTableViewPerfil.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
    }

}

extension PerfilViewController: PerfilViewControllerProtocol {
    internal func reloadData() {
        self.myTableViewPerfil.reloadData()
    }
}

extension PerfilViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return presenter?.getDataCellForRowPost() ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch  indexPath.section {
        case 0:
            let cellPerfil = myTableViewPerfil.dequeueReusableCell(withIdentifier: "PerfilTableViewCell", for: indexPath) as! PerfilTableViewCell
            if let modelData = self.presenter?.getInformationPerfilCell(){
                cellPerfil.configCell(model: modelData)
            }
            return cellPerfil
        default:
            let cellPost = myTableViewPerfil.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            if let modelData = self.presenter?.getInformationForRowCell(indexPath: indexPath.row) {
                cellPost.configCell(model: modelData)
            }
            return cellPost
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return 215
        default:
            return UITableView.automaticDimension
        }
    }
}
