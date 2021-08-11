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

protocol ListaGrouponViewPresenterInterface: ViewPresenterInterface {
    func reloadInformationInView()
}

class ListaGrouponViewController: UIViewController, ViewInterface {

    // MARK: - Dependencias
    var presenter: ListaGrouponPresenterViewInterface!
    
    // MARK: - Outlets
    
    @IBOutlet weak var myCuponListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.updateView()
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.myCuponListTableView.delegate = self
        self.myCuponListTableView.dataSource = self
        self.myCuponListTableView.register(UINib(nibName: CuponCell.defaultReuseIdentifierView, bundle: nil), forCellReuseIdentifier: CuponCell.defaultReuseIdentifierView)
    }

}

extension ListaGrouponViewController: ListaGrouponViewPresenterInterface {

    func reloadInformationInView() {
        self.myCuponListTableView.reloadData()
    }
}

extension ListaGrouponViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellCupon = self.myCuponListTableView.dequeueReusableCell(withIdentifier: CuponCell.defaultReuseIdentifierView, for: indexPath) as! CuponCell
        if let model = self.presenter.objectFrom(index: indexPath.row) {
            cellCupon.configCell(data: model)
        }
        return cellCupon
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.showDetailVC(index: indexPath.row)
    }
}
