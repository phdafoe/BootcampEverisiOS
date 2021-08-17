/*
Copyright, everisSL
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
*/

import UIKit

protocol LoginViewPresenterInterface: ViewPresenterInterface {
    func reloadInformationInView()
}

class LoginViewController: UIViewController, ViewInterface {

    var presenter: LoginPresenterViewInterface!
    
    // MARK: - OUtlets
    @IBOutlet weak var buttonConditions: UIButton!
    @IBOutlet weak var textViewConditions: UITextView!
    @IBOutlet weak var buttonClave: UIButton!
    @IBOutlet weak var buttonQuestion: UIButton!
    @IBOutlet weak var labelTopInfo: UILabel!
    
    // MARK: - Actions
    @IBAction func actionChangeCheckState(_ sender: Any) {
        self.buttonConditions.isSelected = !self.buttonConditions.isSelected
    }
    
    @IBAction func actionWhatsClave(_ sender: Any) {
        
    }
    
    @IBAction func loginActionWhatsClave(_ sender: Any) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupUserNotLogged()
    }
    
    private func setupView(){
        self.buttonConditions.isSelected = false
    }
    
    private func setupUserNotLogged() {
        self.buttonClave.isEnabled = self.buttonConditions.isSelected
        self.configuredTopView(mainText: "Para acceder a Mi Carpeta Ciudadana debes de hacerlo mediante tu identidad electrónica Cl@ve", boldText: "Mi Carpeta Ciudadana")
    }
    
    
    private func configuredTopView(mainText: String, boldText: String) {
        self.labelTopInfo.styles([LabelStyles(pText: mainText,
                                              pStyle: [NSAttributedString.Key.font : MainFont.regular.font(size: SizeFont.extraLarge) as Any]),
                                  LabelStyles(pText: boldText, pStyle: [NSAttributedString.Key.font : MainFont.bold.font(size: SizeFont.extraLarge) as Any])])
    }
    
   

}

extension LoginViewController: LoginViewPresenterInterface {

    func reloadInformationInView() {
        
    }
}

class LabelStyles {
    let text: String
    let style: [NSAttributedString.Key : Any]
    
    init(pText: String, pStyle: [NSAttributedString.Key: Any]) {
        self.text = pText
        self.style = pStyle
    }
}

extension UILabel {
    
    func styles(_ styles: [LabelStyles]) {
        guard let mainText = styles.first?.text, let mainAttributed = styles.first?.style else { return }
        let attributes = NSMutableAttributedString(string: mainText, attributes: mainAttributed)
        for style in styles {
            let styleRange = (attributes.string as NSString).range(of: style.text)
            attributes.setAttributes(style.style as [NSAttributedString.Key: Any], range: styleRange)
        }
        self.attributedText = attributes
    }
}
