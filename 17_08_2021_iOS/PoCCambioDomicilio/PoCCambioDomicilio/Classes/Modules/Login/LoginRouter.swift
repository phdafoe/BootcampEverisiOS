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

import Foundation
import UIKit

protocol LoginRouterPresenterInterface: RouterPresenterInterface {
  func showMessageWhatIsKey()
   func showHome()
}

final class LoginRouter: RouterInterface {
    
    
    weak var presenter: LoginPresenterRouterInterface!
    weak var viewController: UIViewController?
}

extension LoginRouter: LoginRouterPresenterInterface {
    func showHome() {
        let vc = HomeTabBarCoordinator.homeTabBar()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.viewController?.present(vc, animated: false, completion: nil)
    }
    
    func showMessageWhatIsKey() {
        let dto = MessageViewDTO(titulo: "Info",
                                 contenido: "Una vez realizado un nuevo empadronamiento, aqui podrás comunicar a los distintos organismos de la administración (como Direccion general de tráfico, agencia trobitaria y Seguridad social entre otros), tu cambio de domicilio sin tener que realizarlo presencialmente en cada uno de ellos. \n\n En el caso de no aparecer la información correcta del ultimo empadronamiento realizado deberás ponerte en contacto con tu oficina de empadronamiento",
                                 botones: true)
        let vc = MessageCoordinator().build(dto: dto)
        vc.modalPresentationStyle = .overCurrentContext
        self.viewController?.present(vc, animated: false, completion: nil)
       // present(vc, animated: false, completion: nil)
        
    }
    
    
}
