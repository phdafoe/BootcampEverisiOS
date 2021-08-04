//
//  Utils.swift
//  EverisTask
//
//  Created by Andres Felipe Ocampo Eljaiek on 4/8/21.
//

import Foundation
import UIKit

class Utils {
    
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
    
}


class ManagerPhoto: NSObject {
    
    var alertVC = UIAlertController()
    var imagePicker = UIImagePickerController()
    
    func showPhotoMenu() -> (UIAlertController, UIImagePickerController) {
        
        alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let takePhotoAction = UIAlertAction(title: "Tomar Foto", style: .default) { Void in
            self.takePhotowithCamera()
        }
        let chooseFromLibraryAction = UIAlertAction(title: "Escoge de la Librería", style: .default) { Void  in
            self.imagePicker = self.choosePhotoFromLibrary()
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(takePhotoAction)
        alertVC.addAction(chooseFromLibraryAction)
        
        return (alertVC,imagePicker)
        
    }
    
    func takePhotowithCamera() -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        return imagePicker
        
    }
    
    func choosePhotoFromLibrary() -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        return imagePicker
    }
}

extension ManagerPhoto: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            myImagenNuevaTareaIV.contentMode = .scaleAspectFit
//            myImagenNuevaTareaIV.image = pickedImage
//            fotoSeleccionada = true
//        }
//
//        dismiss(animated: true, completion: nil)
//    }
//
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        dismiss(animated: true, completion: nil)
//    }
}
