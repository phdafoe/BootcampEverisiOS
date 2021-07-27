//
//  ViewController.swift
//  AppAlerts
//
//  Created by Andres Felipe Ocampo Eljaiek on 27/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:  - Variables locales
    var loginTextField: UITextField?
    var passwordTextField: UITextField?
    
    // MARK: - IBOutles
    @IBOutlet var uiAlertControllerSimple: UIButton!
    
    
    
    // MARK: - IBActions
    @IBAction func alertVC(_ sender: AnyObject) {
        
        switch sender.tag {
        case 0:
            self.present(self.myAlertVC(myTitle: "Alert Controller Standard",
                                        myMessage: "Este alert Controller es la presentación por defecto"),
                         animated: true,
                         completion: nil)
        case 1:
            let alertVC = UIAlertController(title: "Alert Controller Standard", message: "Este alert Controller tiene un TextField", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            let aceptarAction = UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
                if !(self.loginTextField?.text?.isEmpty ?? false){
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "TercerViewController")
                    self.present(vc, animated: true)
                }
            })
            alertVC.addAction(cancelAction)
            alertVC.addAction(aceptarAction)
            
            alertVC.addTextField { (textResult) in
                self.loginTextField = textResult
                self.loginTextField?.placeholder = "Introduce tu username"
            }
            
            self.present(alertVC, animated: true, completion: nil)
            
        case 2:
            let alertVC = UIAlertController(title: "Alert Controller Standard", message: "Este alert Controller formulario login", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
            let aceptarAction = UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
                if !(self.loginTextField?.text?.isEmpty ?? false) && !(self.passwordTextField?.text?.isEmpty ?? false){
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "TercerViewController")
                    vc.modalTransitionStyle = .crossDissolve
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            })
            alertVC.addAction(cancelAction)
            alertVC.addAction(aceptarAction)
            
            alertVC.addTextField { (textResult) in
                self.loginTextField = textResult
                self.loginTextField?.placeholder = "Introduce tu username"
            }
            
            alertVC.addTextField { (textResult) in
                self.passwordTextField = textResult
                self.passwordTextField?.placeholder = "Introduce tu password"
                self.passwordTextField?.isSecureTextEntry = true
            }
            
            self.present(alertVC, animated: true, completion: nil)
        case 3:
            let alertVC = UIAlertController(title: "Alert Controller Standard", message: "Este alert Controller formulario login", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            alertVC.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            alertVC.addAction(UIAlertAction(title: "Botón 3", style: .destructive, handler: nil))
            alertVC.addAction(UIAlertAction(title: "Botón 4", style: .default, handler: { _ in
                self.choosePhotoLibrary()
            }))
            self.present(alertVC, animated: true, completion: nil)
        default:
            let alertVC = UIAlertController(title: "Alert Controller Standard", message: "Este alert Controller formulario login", preferredStyle: .actionSheet)
            alertVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            alertVC.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            alertVC.addAction(UIAlertAction(title: "Botón 3", style: .destructive, handler: nil))
            alertVC.addAction(UIAlertAction(title: "Botón 4", style: .default, handler: { _ in
                self.choosePhotoLibrary()
            }))
            self.present(alertVC, animated: true, completion: nil)
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        customizationButton()
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Private methods
    private func customizationButton() {
        uiAlertControllerSimple.layer.cornerRadius = 20
    }
    
    private func myAlertVC(myTitle: String, myMessage: String) -> UIAlertController {
        let alertVC = UIAlertController(title: myTitle, message: myMessage, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let aceptarAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alertVC.addAction(cancelAction)
        alertVC.addAction(aceptarAction)
        return alertVC
    }

}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func choosePhotoLibrary(){
        let imagePC = UIImagePickerController()
        imagePC.sourceType = .photoLibrary
        imagePC.delegate = self
        imagePC.allowsEditing = true
        present(imagePC, animated: true, completion: nil)
    }
}

