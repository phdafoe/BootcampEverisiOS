//
//  SegundaViewController.swift
//  AppNavigation
//
//  Created by Andres Felipe Ocampo Eljaiek on 28/7/21.
//

import UIKit

class SegundaViewController: UIViewController {
    
    // MARK: - Varibales globales
    var variables = GlobalUserData()
    var edadPerro: Int?
    
    // MARK: - Outlets
    @IBOutlet weak var nombreLBL: UILabel!
    @IBOutlet weak var apellidoLBL: UILabel!
    @IBOutlet weak var edadPerroLBL: UILabel!
    @IBOutlet weak var movilTF: UITextField!
    @IBOutlet weak var direccionTF: UITextField!
    @IBOutlet weak var calculoEdadPerroTF: UITextField!
    
    // MARK: - Actions
    
    @IBAction func calculoEdadPerroACTION(_ sender: Any) {
        edadPerro = Int(calculoEdadPerroTF.text!)
        if let edadPerroDes = edadPerro{
            let nuevaEdadPerro = edadPerroDes * 7
            self.edadPerroLBL.text = "La edad de mi perro es: \(nuevaEdadPerro)"
        } else {
            present(displayAlertVC(myTitle: "Hey",
                                   myMessage: "Por favor intruduce datos para calcular la edad de tu perro"),
                    animated: true) {
                self.showVC()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showInfo()

    }
    
    private func showInfo(){
        self.nombreLBL.text = variables.nombreData
        self.apellidoLBL.text = variables.apellidoData
        self.movilTF.keyboardType = .numberPad
        self.calculoEdadPerroTF.keyboardType = .numberPad
    }
    
    func showVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.popViewController(animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "segueV3" {
            if !(self.movilTF.text?.isEmpty ?? false) && !(self.direccionTF.text?.isEmpty ?? false) {
                let vc3 = segue.destination as! TerceraViewController
                vc3.variables.nombreData = variables.nombreData
                vc3.variables.apellidoData = variables.apellidoData
                vc3.variables.movilData = self.movilTF.text
                vc3.variables.direccionData = self.direccionTF.text
            } else {
                present(displayAlertVC(myTitle: "Hey",
                                       myMessage: "Tienes que rellenar el formulario"),
                        animated: true,
                        completion: nil)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}
