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

protocol MessageViewPresenterInterface: ViewPresenterInterface {
    func reloadInformationInView()
}

class MessageViewController: UIViewController, ViewInterface {

    var presenter: MessagePresenterViewInterface!
    
    
    //MARK : - IBOutlet
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var contenidoLabel: UILabel!
    @IBOutlet weak var botonAceptar: UIButton!
    @IBOutlet weak var modalHeight: NSLayoutConstraint!
    
    
    var initialHeight: CGFloat = 450
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView(){
        tituloLabel.text = presenter.getTitulo()
        contenidoLabel.text = presenter.getContenido()
        if !presenter.getBotones(){
            botonAceptar.isHidden = true
        }
        containerView.layer.cornerRadius = 20
        backgroundView.isUserInteractionEnabled = true
        let deleteGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector (dismissView))
        backgroundView.addGestureRecognizer(deleteGestureRecognizer)
        
        let resizeGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector (handleResize(gesture:)))
        containerView.addGestureRecognizer(resizeGestureRecognizer)
        
    }
    @objc func handleResize(gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: view)
        
        var newHeight = initialHeight + (-translation.y)
        
        if newHeight <= 200 {
            cerrarModal()
        }else{
            newHeight = min(newHeight, UIScreen.main.bounds.height)
            modalHeight.constant = newHeight
            
            if gesture.state == .ended{
                initialHeight = newHeight
            }
        }

        
    }
    
    
    private func cerrarModal(animated : Bool? = false){
            dismiss(animated: animated ?? false, completion: nil)
      
    }
    
    @IBAction func closeModal(_ sender: Any) {
        cerrarModal()
    }
 
    @IBAction func aceptar(_ sender: Any) {
        cerrarModal()
    }
    
    @objc
    func dismissView(){
        cerrarModal()
    }
    
}

extension MessageViewController: MessageViewPresenterInterface {

    func reloadInformationInView() {
        
    }
}
