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

import UIKit

protocol ListaCochesViewProtocol {
    func reloadData()
}

class ListaCochesViewController: UIViewController {
    
    // MARK: - ID
    var presenter: ListaCochesPresenterProtocol?
    
    // MARK: - Outlets
    @IBOutlet weak var myTableViewCoches: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lista de Coches"
        self.presenter?.setArrayData()
        setupTableView()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        self.myTableViewCoches.delegate = self
        self.myTableViewCoches.dataSource = self
        self.myTableViewCoches.register(UINib(nibName: "CochesTableViewCell", bundle: nil), forCellReuseIdentifier: "CochesTableViewCell")
    }

}

extension ListaCochesViewController: ListaCochesViewProtocol{
    func reloadData() {
        self.myTableViewCoches.reloadData()
    }
}

extension ListaCochesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRowCell() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellCoches = self.myTableViewCoches.dequeueReusableCell(withIdentifier: "CochesTableViewCell", for: indexPath) as! CochesTableViewCell
        if let modelData = self.presenter?.getInformationCellForRow(indexPath: indexPath.row){
            cellCoches.configCell(model: modelData)
        }
        return cellCoches
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

extension ListaCochesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}



