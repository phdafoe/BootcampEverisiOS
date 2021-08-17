//
//  SegundaViewController.swift
//  LocalizacionApp
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/8/21.
//

import UIKit

class SegundaViewController: UIViewController {
    
    let myDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBAction func closeVC(_ sender: Any) {
        self.myDelegate.canRotate = false
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myDelegate.canRotate = true
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
