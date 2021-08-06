//
//  SplashDosViewController.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 6/8/21.
//

import UIKit

protocol SplashDosViewPresenterInterface: ViewPresenterInterface {
    func reloadInformationInView()
}

class SplashDosViewController: UIViewController, ViewInterface {

    var presenter: SplashDosPresenterViewInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.fetchData()
    }

}

extension SplashDosViewController: SplashDosViewPresenterInterface {

    func reloadInformationInView() {
        
    }
}
