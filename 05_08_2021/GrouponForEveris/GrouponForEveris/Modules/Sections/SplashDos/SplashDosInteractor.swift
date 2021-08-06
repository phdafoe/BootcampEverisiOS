//
//  SplashDosInteractor.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 6/8/21.
//

import Foundation

protocol SplashDosInteractorPresenterInterface: InteractorPresenterInterface {

}

final class SplashDosInteractor: InteractorInterface {
    
    weak var presenter: SplashDosPresenterInteractorInterface!
    
}

extension SplashDosInteractor: SplashDosInteractorPresenterInterface {

}
