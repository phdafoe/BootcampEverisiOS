//
//  UserDefaultViewController.swift
//  AppUserdefaultIntro
//
//  Created by Andres Felipe Ocampo Eljaiek on 2/8/21.
//

import UIKit

class UserDefaultViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var myImagenPerfil: UIImageView!
    @IBOutlet weak var myNombreTF: UITextField!
    @IBOutlet weak var myApellidoTF: UITextField!
    @IBOutlet weak var myDireccionTF: UITextField!
    @IBOutlet weak var myTelefonoTF: UITextField!
    @IBOutlet weak var myActualizacionFechaLBL: UILabel!
    
    var existeFoto = false
    
    // MARK: - Actions
    
    @IBAction func salvarDatos(_ sender: Any) {
        
        if !(myNombreTF.text?.isEmpty ?? false) &&
            !(myApellidoTF.text?.isEmpty ?? false) &&
            !(myDireccionTF.text?.isEmpty ?? false) &&
            !(myTelefonoTF.text?.isEmpty ?? false) &&
            existeFoto {
            
            Utils.UserDefaultDDBB.prefs.set(self.myNombreTF.text, forKey: Utils.Constantes.nombre)
            Utils.UserDefaultDDBB.prefs.set(self.myApellidoTF.text, forKey: Utils.Constantes.apellido)
            Utils.UserDefaultDDBB.prefs.set(self.myDireccionTF.text, forKey: Utils.Constantes.direccion)
            Utils.UserDefaultDDBB.prefs.set(self.myTelefonoTF.text, forKey: Utils.Constantes.telefono)
            
            let fechaActual = Date()
            Utils.UserDefaultDDBB.prefs.set(fechaActual, forKey: Utils.Constantes.ultimaActualizacion)
            
            let imageData = self.myImagenPerfil.image?.jpegData(compressionQuality: 0.5)
            Utils.UserDefaultDDBB.prefs.set(imageData, forKey: Utils.Constantes.imagePerfil)

            present(Utils.showAlertView(title: "Hey", message: "los datos se han salvado correctamente", callBack: {
                self.myNombreTF.text = ""
                self.myApellidoTF.text = ""
                self.myDireccionTF.text = ""
                self.myTelefonoTF.text = ""
                self.myActualizacionFechaLBL.text = ""
                self.myImagenPerfil.image = UIImage(named: "placeholder")
            }), animated: true, completion: nil)
            
        } else {
            present(Utils.showAlertView(title: "Hey", message: "rellena todos los datos", callBack: {
                //
            }), animated: true, completion: nil)
        }
    }
    
    @IBAction func recuperarDatos(_ sender: Any) {
        
        if let imageData = Utils.UserDefaultDDBB.prefs.object(forKey: Utils.Constantes.imagePerfil) as? Data {
            self.myImagenPerfil.image = UIImage(data: imageData)
        }
        
        Utils.UserDefaultDDBB.dateFormatter.dateStyle = .medium
        
        if let ultimaActualizacion = Utils.UserDefaultDDBB.prefs.object(forKey: Utils.Constantes.ultimaActualizacion) as? Date {
            self.myActualizacionFechaLBL.text = "Ultima actualizacion \(Utils.UserDefaultDDBB.dateFormatter.string(from: ultimaActualizacion as Date))"
        } else {
            self.myActualizacionFechaLBL.text = "actualizacion no realizada"
        }
        
        if let nombreData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.Constantes.nombre) {
            self.myNombreTF.text = nombreData
        }
        
        if let apellidoData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.Constantes.apellido) {
            self.myApellidoTF.text = apellidoData
        }
        
        if let direccionData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.Constantes.direccion) {
            self.myDireccionTF.text = direccionData
        }
        
        if let telefonoData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.Constantes.telefono) {
            self.myTelefonoTF.text = telefonoData
        }
    }
    

    // MARK: - ciclo de vida del controlador
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myImagenPerfil.isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(showActionGesture))
        self.myImagenPerfil.addGestureRecognizer(tapGR)
    }
    
    
    // MARK: - Metodos privados
    @objc
    func showActionGesture() {
       showPickerPhoto()
    }
    
    func showPickerPhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            showPhotoMenu()
        } else {
            choosePhotoFromLibrary()
        }
    }
    
    func showPhotoMenu() {
        let actionSheet = UIAlertController(title: "Selecciona la Opcion", message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Tomar foto", style: .default, handler: { _ in
            self.takePhotoWithCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Escoge de la libreria de fotos", style: .default, handler: { _ in
            self.choosePhotoFromLibrary()
        }))
        present(actionSheet, animated: true, completion: nil)
    }
    
    func takePhotoWithCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func choosePhotoFromLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }

}


extension UserDefaultViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickerImage = info[.originalImage] as? UIImage {
            self.myImagenPerfil.contentMode = .scaleAspectFill
            self.myImagenPerfil.image = pickerImage
            self.existeFoto = true
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}


class Utils {
    
    struct UserDefaultDDBB {
        static let prefs = UserDefaults.standard
        static let dateFormatter = DateFormatter()
    }
    
    // MARK: - Constantes
    struct Constantes {
        static let nombre = "NOMBRE"
        static let apellido = "APELLIDO"
        static let direccion = "DIRECCION"
        static let telefono = "TELEFONO"
        static let ultimaActualizacion = "ULTIMA_ACTUALIZACION"
        static let imagePerfil = "IMAGEN_PERFIL"
    }
    
    
    static func showAlertView(title: String, message: String, callBack: @escaping () -> ()) -> UIAlertController {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            callBack()
        }))
        return alertVC
    }
}
