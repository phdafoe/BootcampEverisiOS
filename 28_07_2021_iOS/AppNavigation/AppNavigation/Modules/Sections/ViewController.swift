//
//  ViewController.swift
//  AppNavigation
//
//  Created by Andres Felipe Ocampo Eljaiek on 28/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: - Outlets
    @IBOutlet weak var nombreTF: UITextField!
    @IBOutlet weak var appellidoTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueV2"{
            
            if !(self.nombreTF.text?.isEmpty ?? false) && !(self.appellidoTF.text?.isEmpty ?? false) {
                let vc2 = segue.destination as! SegundaViewController
                vc2.variables.nombreData = self.nombreTF.text
                vc2.variables.apellidoData = self.appellidoTF.text
            } else {
                present(displayAlertVC(myTitle: "Hey",
                                       myMessage: "Tienes que rellenar el formulario"),
                        animated: true,
                        completion: nil)
            }
        }
    }
    
    
    @IBAction func cerraVCs(segue: UIStoryboardSegue){
        print("Logout completado")
    }


}

