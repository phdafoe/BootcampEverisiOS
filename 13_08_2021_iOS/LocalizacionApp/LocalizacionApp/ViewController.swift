//
//  ViewController.swift
//  LocalizacionApp
//
//  Created by Andres Felipe Ocampo Eljaiek on 13/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Outlets
    @IBOutlet weak var greetingLBL1: UILabel!
    @IBOutlet weak var greetingLBL2: UILabel!
    @IBOutlet weak var greetingLBL3: UILabel!
    @IBOutlet weak var greetingLBL4: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.greetingLBL1.text = LocalizedKeys.General.generalGreeting.localized
        self.greetingLBL2.text = LocalizedKeys.General.generalGreetingMorning.localized
        self.greetingLBL3.text = LocalizedKeys.General.generalGreetingEvening.localized
        self.greetingLBL4.text = LocalizedKeys.General.generalGreetingNight.localized
        
        
        // Do any additional setup after loading the view.
    }


}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
