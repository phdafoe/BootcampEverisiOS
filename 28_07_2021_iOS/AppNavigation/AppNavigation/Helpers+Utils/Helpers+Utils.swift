//
//  Helpers+Utils.swift
//  AppNavigation
//
//  Created by Andres Felipe Ocampo Eljaiek on 28/7/21.
//

import Foundation
import UIKit


func displayAlertVC(myTitle: String, myMessage: String) -> UIAlertController {
    let alertVC = UIAlertController(title: myTitle, message: myMessage, preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    return alertVC
}


func createPickerView(myTextField: UITextField,
                      myArray: [String],
                      myTag: Int,
                      myDelegate: UIPickerViewDelegate,
                      myDataSourcePicker: UIPickerViewDataSource) -> UIPickerView {
    let pickerView = UIPickerView()
    pickerView.delegate = myDelegate
    pickerView.dataSource = myDataSourcePicker
    pickerView.tag = myTag
    myTextField.inputView = pickerView
    myTextField.text = myArray[0]
    return pickerView
    
}


struct GlobalUserData {
    
    var nombreData: String?
    var apellidoData: String?
    var movilData: String?
    var direccionData: String?
    var edadPerroData: String?
    var codigoPostalData: String?
    var ciudadData: String?
    var posicionGeograficaData: String?
    
}

