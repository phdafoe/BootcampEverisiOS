//
//  SegundaViewController.swift
//  AppDatePicker
//
//  Created by Andres Felipe Ocampo Eljaiek on 27/7/21.
//

import UIKit

class SegundaViewController: UIViewController {
    
    
    // MARK: - Variables locales
    var pickerQuesosArrayData = ["Mozzarella", "Gorgonzola", "Provolone", "Stilton", "Asiago"]
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tituloQuesoLBL: UILabel!
    @IBOutlet weak var detalleQuesoTextView: UITextView!
    @IBOutlet weak var imagenQuesoImageView: UIImageView!
    @IBOutlet weak var seleccionQuesoPickerView: UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.seleccionQuesoPickerView.delegate = self
        self.seleccionQuesoPickerView.dataSource = self
        
        self.title = pickerQuesosArrayData[0]
        
        self.tituloQuesoLBL.text = pickerQuesosArrayData[0]
        self.imagenQuesoImageView.image = UIImage(named: pickerQuesosArrayData[0])
        self.detalleQuesoTextView.text = "Compounding the dangerousness of homemade mozzarella is the fact that it comes together in about twenty minutes. You warm the milk with some citric acid (not as scary as it sounds), add the rennet to separate the milk into curds and whey, heat it again, knead stretch knead, and then you have mozzarella. It’s basically magic. Don’t be scared off by the citric acid and the rennet. Both things sound like something Batman might encounter on a bad day in Gotham, but they are actually normal, everyday ingredients.Citric acid is just a powdered form of the same mouth-puckering acid found in lemons and limes. It’s added here to help acidify and coagulate the milk. Rennet can be found in both tablet or liquid form, as well as in vegetarian or…er…non-vegetarian versions. Its job is to set the proteins in the milk and form solid, stretchy curds."
    }

}

extension SegundaViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerQuesosArrayData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.title = pickerQuesosArrayData[row]
        self.tituloQuesoLBL.text = pickerQuesosArrayData[row]
        self.imagenQuesoImageView.image = UIImage(named: pickerQuesosArrayData[row])
        
        switch row {
        case 0:
            self.detalleQuesoTextView.text = "knead stretch knead, and then you have mozzarella. It’s basically magic. Don’t be scared off by the citric acid and the rennet. Both things sound like something Batman might encounter on a bad day in Gotham, but they are actually normal, everyday ingredients.Citric acid is just a powdered form of the same mouth-puckering acid found in lemons and limes. It’s added here to help acidify and coagulate the milk. Rennet can be found in both tablet or liquid form, as well as in vegetarian or…er…non-vegetarian versions. Its job is to set the proteins in the milk and form solid, stretchy curds."
        case 1:
            self.detalleQuesoTextView.text = "Don’t be scared off by the citric acid and the rennet. Both things sound like something Batman might encounter on a bad day in Gotham, but they are actually normal, everyday ingredients.Citric acid is just a powdered form of the same mouth-puckering acid found in lemons and limes. It’s added here to help acidify and coagulate the milk. Rennet can be found in both tablet or liquid form, as well as in vegetarian or…er…non-vegetarian versions. Its job is to set the proteins in the milk and form solid, stretchy curds."
        case 2:
            self.detalleQuesoTextView.text = "Both things sound like something Batman might encounter on a bad day in Gotham, but they are actually normal, everyday ingredients.Citric acid is just a powdered form of the same mouth-puckering acid found in lemons and limes. It’s added here to help acidify and coagulate the milk. Rennet can be found in both tablet or liquid form, as well as in vegetarian or…er…non-vegetarian versions. Its job is to set the proteins in the milk and form solid, stretchy curds."
        case 3:
            self.detalleQuesoTextView.text = "Everyday ingredients.Citric acid is just a powdered form of the same mouth-puckering acid found in lemons and limes. It’s added here to help acidify and coagulate the milk. Rennet can be found in both tablet or liquid form, as well as in vegetarian or…er…non-vegetarian versions. Its job is to set the proteins in the milk and form solid, stretchy curds."
        case 4:
            self.detalleQuesoTextView.text = "It’s added here to help acidify and coagulate the milk. Rennet can be found in both tablet or liquid form, as well as in vegetarian or…er…non-vegetarian versions. Its job is to set the proteins in the milk and form solid, stretchy curds."
        default:
            self.detalleQuesoTextView.text = "Rennet can be found in both tablet or liquid form, as well as in vegetarian or…er…non-vegetarian versions. Its job is to set the proteins in the milk and form solid, stretchy curds."
        }
        
    }
}

extension SegundaViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerQuesosArrayData.count
    }
}
