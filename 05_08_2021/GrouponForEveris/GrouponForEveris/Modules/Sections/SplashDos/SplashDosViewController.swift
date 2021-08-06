//
//  SplashDosViewController.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 6/8/21.
//

import UIKit

protocol SplashDosViewPresenterInterface: ViewPresenterInterface {

}

class SplashDosViewController: UIViewController, ViewInterface {

    var presenter: SplashDosPresenterViewInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SplashDosViewController: SplashDosViewPresenterInterface {

}
