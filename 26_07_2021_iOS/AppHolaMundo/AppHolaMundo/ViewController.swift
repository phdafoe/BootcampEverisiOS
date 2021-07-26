//
//  ViewController.swift
//  AppHolaMundo
//
//  Created by Andres Felipe Ocampo Eljaiek on 26/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var holaMundoLBL: UILabel!
    @IBOutlet weak var saludaSolLBL: UILabel!
    @IBOutlet weak var consTrailingPrimerLBL: NSLayoutConstraint!
    
    
    // MARK: - IBActions
    
    @IBAction func CambiaNombreACTION(_ sender: Any) {
        holaMundoLBL.text = "Hola Bootcamp iOS Everis"
        saludaSolLBL.text = "Hola Sol y Luna"
        consTrailingPrimerLBL.constant = 50
    }
    
    
    // MARK: - life VC
    override func viewDidLoad() {
        super.viewDidLoad()
   
        print("Aqui estamos currando a tope")
    }


}

// MARK: - Extension VC

