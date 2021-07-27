//
//  TerceraViewController.swift
//  AppDatePicker
//
//  Created by Andres Felipe Ocampo Eljaiek on 27/7/21.
//

import UIKit

class TerceraViewController: UIViewController {
    
    // MARK: - Variables
    var localidadesMadridDataSource = ["La Latina", "Salamanca", "Fuencarral", "PepitoPerez"]
    var codigoPostalDataSource = ["28010", "28009", "28017", "28000"]
    var prioridadDataSource = ["BAJA", "MEDIA", "ALTA", "MUY ALTA"]
    var imagenesPerfilDataSource = ["felipe", "maria", "felipe", "maria"]
    
    
    
    // MARK: - Outles
    @IBOutlet weak var localidadMadrid: UITextField!
    @IBOutlet weak var codigoPostalZona: UITextField!
    @IBOutlet weak var prioridadTrabajo: UITextField!
    @IBOutlet weak var imagenPerfilImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.imagenPerfilImageView.image = UIImage(named: imagenesPerfilDataSource[0])

        createPickerView(myTag: 0, myTextFieldCustom: localidadMadrid, myArray: localidadesMadridDataSource)
        createPickerView(myTag: 1, myTextFieldCustom: codigoPostalZona, myArray: codigoPostalDataSource)
        createPickerView(myTag: 2, myTextFieldCustom: prioridadTrabajo, myArray: prioridadDataSource)
    }
    
    private func createPickerView(myTag: Int, myTextFieldCustom: UITextField, myArray: [String]) {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = myTag
        myTextFieldCustom.inputView = pickerView
        myTextFieldCustom.text = myArray[0]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

extension TerceraViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return localidadesMadridDataSource.count
        case 1:
            return codigoPostalDataSource.count
        default:
            return prioridadDataSource.count
        }
    }
}


extension TerceraViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return localidadesMadridDataSource[row]
        case 1:
            return codigoPostalDataSource[row]
        default:
            return prioridadDataSource[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            localidadMadrid.text = localidadesMadridDataSource[row]
        case 1:
            codigoPostalZona.text = codigoPostalDataSource[row]
        default:
            prioridadTrabajo.text = prioridadDataSource[row]
            imagenPerfilImageView.image = UIImage(named: imagenesPerfilDataSource[row])
        }
    }
}
