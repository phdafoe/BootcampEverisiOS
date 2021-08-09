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
// MARK: - interfaces
public protocol RouterPresenterInterface: class {
    
}

public protocol InteractorPresenterInterface: class {

}

public protocol PresenterRouterInterface: class {

}

public protocol PresenterInteractorInterface: class {

}

public protocol PresenterViewInterface: class {

}

public protocol ViewPresenterInterface: class {

}

// MARK: - viper
public protocol RouterInterface: RouterPresenterInterface {
    associatedtype PresenterRouter

    var presenter: PresenterRouter! { get set }
}

public protocol InteractorInterface: InteractorPresenterInterface {
    associatedtype PresenterInteractor

    var presenter: PresenterInteractor! { get set }
}

public protocol PresenterInterface: PresenterRouterInterface & PresenterInteractorInterface & PresenterViewInterface {
    associatedtype RouterPresenter
    associatedtype InteractorPresenter
    associatedtype ViewPresenter

    var router: RouterPresenter! { get set }
    var interactor: InteractorPresenter! { get set }
    var view: ViewPresenter! { get set }
}

public protocol ViewInterface: ViewPresenterInterface {
    associatedtype PresenterView

    var presenter: PresenterView! { get set }
}

public protocol EntityInterface {

}

// MARK: - module
public protocol ModuleInterface {
    
    associatedtype View where View: ViewInterface
    associatedtype Presenter where Presenter: PresenterInterface
    associatedtype Router where Router: RouterInterface
    associatedtype Interactor where Interactor: InteractorInterface
    
    func coordinator(view: View, presenter: Presenter, router: Router, interactor: Interactor)
}

public extension ModuleInterface {
    
    func coordinator(view: View, presenter: Presenter, router: Router, interactor: Interactor) {
        view.presenter = (presenter as! Self.View.PresenterView)
        presenter.view = (view as! Self.Presenter.ViewPresenter)
        presenter.interactor = (interactor as! Self.Presenter.InteractorPresenter)
        presenter.router = (router as! Self.Presenter.RouterPresenter)
        interactor.presenter = (presenter as! Self.Interactor.PresenterInteractor)
        router.presenter = (presenter as! Self.Router.PresenterRouter)
    }
}
