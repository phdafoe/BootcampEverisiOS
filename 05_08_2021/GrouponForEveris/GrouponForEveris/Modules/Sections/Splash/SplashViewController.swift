//
//  SplashViewController.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/8/21.
//

import UIKit

protocol SplashViewControllerProtocol {
    
}


class SplashViewController: BaseViewController<SplashPresenterProtocol>, ReuseIdentifierViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

extension SplashViewController: SplashViewControllerProtocol {
    
}
