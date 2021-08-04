//
//  CategoriaViewController.swift
//  EverisTask
//
//  Created by Andres Felipe Ocampo Eljaiek on 4/8/21.
//

import UIKit

protocol CategoriaViewControllerDelegate: AnyObject {
    func nombreCategoriaSeleccionada(_ categoriaClass: CategoriaViewController, categoria row: String)
}

class CategoriaViewController: UIViewController {

    weak var delegate: CategoriaViewControllerDelegate?
    var nombreCategoriaSeleccionada = ""
    var selectIndexPath = IndexPath()
    var listadoCategorias = ["Sin Categoría", "Tienda de Apple", "Bar con los amigos", "En la Librería", "En Casa", "En el parque", "En la peluquería", "En el Trabajo"]
    
    @IBOutlet weak var myCatgoriasTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupArrayData()
        setupTableView()

        // Do any additional setup after loading the view.
    }
    
    private func setupArrayData() {
        for index in 0..<listadoCategorias.count {
            if listadoCategorias[index] == nombreCategoriaSeleccionada {
                selectIndexPath = IndexPath(row: index, section: 0)
            }
        }
    }
    
    private func setupTableView() {
        self.myCatgoriasTableView.delegate = self
        self.myCatgoriasTableView.dataSource = self
        self.myCatgoriasTableView.register(UINib(nibName: "ListaTareaCell", bundle: nil), forCellReuseIdentifier: "ListaTareaCell")
    }

}

extension CategoriaViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listadoCategorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellCategoria = self.myCatgoriasTableView.dequeueReusableCell(withIdentifier: "ListaTareaCell", for: indexPath) as! ListaTareaCell
        cellCategoria.myNombreLBL.text = self.listadoCategorias[indexPath.row]
        return cellCategoria
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath != selectIndexPath{
            selectIndexPath = indexPath
            nombreCategoriaSeleccionada = listadoCategorias[indexPath.row]
            self.delegate?.nombreCategoriaSeleccionada(self, categoria: nombreCategoriaSeleccionada)
            self.navigationController?.popViewController(animated: true)
        }
    }
}
