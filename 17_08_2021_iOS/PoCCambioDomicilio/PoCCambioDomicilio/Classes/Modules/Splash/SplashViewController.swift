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

protocol SplashViewPresenterInterface: ViewPresenterInterface {
    func reloadInformationInView()
}

class SplashViewController: UIViewController, ViewInterface {
    
    // MARK: - IBOutlets
    @IBOutlet weak var displayableView: UIView!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var imageVerticalConstraint: NSLayoutConstraint!
    
    // MARK: - Variables
    
    
    @IBAction func showLogin(_ sender: Any) {
        self.presenter.showLogin()
    }
    var presenter: SplashPresenterViewInterface!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
        self.viewHeight.constant = 30
        self.imageVerticalConstraint.constant = 500
        self.continueBtn.layer.cornerRadius = 15
        self.continueBtn.isHidden = true
        self.titleLbl.text = "Cambio de domicilio"
        
        self.firstDisplay()
    }
    
    private func firstDisplay() {
        view.layoutIfNeeded()
        self.textLbl.text = "Una relación ágil y sencilla con las administraciones públicas"
        self.viewHeight.constant = 300
        self.imageVerticalConstraint.constant = 230
        
        let options = UIView.AnimationOptions()
        
        UIView.animate(withDuration: 1.0,
                       delay: 1.5,
                       usingSpringWithDamping: 0.65,
                       initialSpringVelocity: 1.0,
                       options: options,
                       animations: {
                        self.view.layoutIfNeeded()
                        self.displayableView.layer.cornerRadius = 15
                       }, completion: {
                        _ in
                        self.secondDisplay()
                       })
    }
    
    private func secondDisplay() {
        
        view.layoutIfNeeded()
        self.viewHeight.constant = 575
        self.imageVerticalConstraint.constant = 100
        
        let options = UIView.AnimationOptions()
        
        UIView.animate(withDuration: 1.0,
                       delay: 2.0,
                       usingSpringWithDamping: 0.65,
                       initialSpringVelocity: 1.0,
                       options: options,
                       animations: {
                        self.view.layoutIfNeeded()
                       }, completion: {
                        _ in
                        self.textLbl.fadeTransition(1.2)
                        self.textLbl.text = "Comunica a los distintos organismos tu cambio de domicilio sin tener que realizarlo presencialmente"
                        self.continueBtn.fadeTransition(0.8)
                        self.continueBtn.isHidden = false
                       })
    }
    
}

extension SplashViewController: SplashViewPresenterInterface {
    
    func reloadInformationInView() {
        
    }
}

extension UIView {
    func fadeTransition(_ duration:CFTimeInterval) {
        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
                                                            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}
