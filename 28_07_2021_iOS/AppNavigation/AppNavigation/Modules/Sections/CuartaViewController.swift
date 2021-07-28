//
//  CuartaViewController.swift
//  AppNavigation
//
//  Created by Andres Felipe Ocampo Eljaiek on 28/7/21.
//

import UIKit
import MessageUI

class CuartaViewController: UIViewController {
    
    
    @IBAction func enviaMail(_ sender: Any) {
        
        //let mailComVC = configuracionMailComposeVC()
        
        if MFMailComposeViewController.canSendMail(){
            present(configuracionMailComposeVC(), animated: true, completion: nil)
        } else {
            present(displayAlertVC(myTitle: "Hey",
                                   myMessage: "No puedee enviar mail"),
                    animated: true,
                    completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    private func configuracionMailComposeVC() -> MFMailComposeViewController {
        let mailComp = MFMailComposeViewController()
        mailComp.mailComposeDelegate = self
        mailComp.setToRecipients([""])
        mailComp.setSubject("")
        let emailBody = "Hola Mundo!! desde la App de Navegacion!!"
        mailComp.setMessageBody(emailBody, isHTML: false)
        return mailComp
    }
    
}

extension CuartaViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
        
    }
}
