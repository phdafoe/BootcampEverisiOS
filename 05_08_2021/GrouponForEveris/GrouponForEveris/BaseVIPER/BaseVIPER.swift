//
//  BaseVIPER.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/8/21.
//

import Foundation
import UIKit

// Patron Arquitectonico -> 1
class BaseViewController<P>: UIViewController {
    
    var presenter: P?
    
}

class BasePresenter<V, R, I> {
    
    var vc: V?
    var router: R?
    var interactor: I?
    
    convenience init(vc: V, router: R? = nil, interactor: I? = nil) {
        self.init()
        self.vc = vc
        self.router = router
        self.interactor = interactor
    }
    
}

class BaseInteractor<P> {
    
    var presenter: P?
    
    convenience init(presenter: P) {
        self.init()
        self.presenter = presenter
    }
}

class BaseRouter<P> {
    
    var presenter: P?
    var viewController: UIViewController?
    
    convenience init(presenter: P? = nil, view: UIViewController? = nil) {
        self.init()
        self.presenter = presenter
        self.viewController = view
    }
    
    
    func push(vc: UIViewController){
        if let navVC = viewController?.navigationController{
            DispatchQueue.main.async {
                navVC.pushViewController(vc, animated: true)
            }
        }
    }
    
    func present(vc: UIViewController){
        DispatchQueue.main.async {
            self.viewController?.present(vc, animated: true, completion: nil)
        }
    }
    
    func popView(){
        if let navVC = self.viewController?.navigationController{
            DispatchQueue.main.async {
                navVC.popViewController(animated: true)
            }
        }
    }
    
    func dissmiss(){
        self.viewController?.dismiss(animated: true, completion: nil)
    }
    
}

class BaseNavigation: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


// Patron Arquitectonico -> 2
