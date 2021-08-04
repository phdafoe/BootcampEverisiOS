//
//  ListaTareasViewController.swift
//  EverisTask
//
//  Created by Andres Felipe Ocampo Eljaiek on 4/8/21.
//

import UIKit

class ListaTareasViewController: UIViewController {
    
    var downloads: [DownloadNewModel]?
    
    @IBOutlet weak var myListaTareasTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()

        // Do any additional setup after loading the view.
    }

    func setupView() {
        SaveFavoritesPresenter.shared.getAllLocal { (results) in
            self.downloads = results?.downloads
        } failure: { (error) in
            print(error ?? "AQUI ANDRES METE GAMBA")
        }
    }

    func setupTableView(){
        self.myListaTareasTableView.delegate = self
        self.myListaTareasTableView.dataSource = self
        self.myListaTareasTableView.register(UINib(nibName: "ListaTareaCell", bundle: nil), forCellReuseIdentifier: "ListaTareaCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myListaTareasTableView.reloadData()
    }

}


extension ListaTareasViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.downloads?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDownload = self.myListaTareasTableView.dequeueReusableCell(withIdentifier: "ListaTareaCell", for: indexPath) as! ListaTareaCell
        cellDownload.myNombreLBL.text = self.downloads?[indexPath.row].newTask
        return cellDownload
    }
}
