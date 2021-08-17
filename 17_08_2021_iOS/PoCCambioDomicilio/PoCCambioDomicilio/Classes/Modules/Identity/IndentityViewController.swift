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

protocol IndentityViewPresenterInterface: ViewPresenterInterface {
    func reloadInformationInView()
}

class IndentityViewController: UIViewController, ViewInterface {

    // MARK: - ID
    var presenter: IndentityPresenterViewInterface!
    
    // MARK: - Outlets
    @IBOutlet weak var myProfileTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.fetchDataIdentity()
        self.setupTableView()
    }
    
    // MARK: - Private methods
    private func setupTableView() {
        self.myProfileTableView.delegate = self
        self.myProfileTableView.dataSource = self
        self.myProfileTableView.register(UINib(nibName: IdentityCell.defaultReuseIdentifierView, bundle: nil), forCellReuseIdentifier: IdentityCell.defaultReuseIdentifierView)
    }

}

extension IndentityViewController: IndentityViewPresenterInterface {

    func reloadInformationInView() {
        DispatchQueue.main.async {
            self.myProfileTableView.reloadData()
        }
    }
    
    
}


extension IndentityViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellProfile = self.myProfileTableView.dequeueReusableCell(withIdentifier: IdentityCell.defaultReuseIdentifierView, for: indexPath) as! IdentityCell
        cellProfile.delegate = self
        if let model = self.presenter.dataCellModel {
            cellProfile.configCell(model: model)
        }
        return cellProfile
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        457
    }
}

extension IndentityViewController: IdentityCellDelegate {
    func showInfoProfile(_ cell: UITableViewCell, showMoreInfo: Bool) {
        if showMoreInfo{
            self.presenter.showMessageMoreInfoProfile()
        }
    }
}
