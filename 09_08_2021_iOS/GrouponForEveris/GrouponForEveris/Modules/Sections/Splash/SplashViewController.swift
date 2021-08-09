//
//  SplashViewController.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/8/21.
//

import UIKit

protocol SplashViewControllerProtocol {
    func reloadInformationInView()
}

class SplashViewController: BaseViewController<SplashPresenterProtocol>, ReuseIdentifierViewController {
    
    
    @IBOutlet weak var myTableViewTest: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchDataFromPresent()
        self.setupTableView()
        // Do any additional setup after loading the view.
    }

    private func setupTableView() {
        self.myTableViewTest.delegate = self
        self.myTableViewTest.dataSource = self
        self.myTableViewTest.register(UINib(nibName: GenericCell.defaultReuseIdentifierView, bundle: nil), forCellReuseIdentifier: GenericCell.defaultReuseIdentifierView)
    }

}

extension SplashViewController: SplashViewControllerProtocol {
    func reloadInformationInView() {
        DispatchQueue.main.async {
            self.myTableViewTest.reloadData()
        }
    }
}

extension SplashViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.presenter?.numberOfRowInsection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellTest = self.myTableViewTest.dequeueReusableCell(withIdentifier: GenericCell.defaultReuseIdentifierView, for: indexPath) as! GenericCell
        if let modelData = self.presenter?.informationForCell(indexPath: indexPath.row) {
            cellTest.configCell(data: modelData)
        }
        return cellTest
    }
}
