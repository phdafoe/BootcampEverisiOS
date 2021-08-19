//
//  MoviesCoordinator.swift
//  EverisMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 19/8/21.
//

import Foundation
import SwiftUI

final class MoviesCoordinator: BaseCoordinator {
    
    typealias ContentView = MoviesView
    typealias Presenter = MoviesPresenter
    typealias Interactor = MoviesInteractor
    
    static func navigation(dto: MoviesCoordinatorDTO? = nil) -> NavigationView<ContentView> {
        NavigationView{
            self.view()
        }
    }
    
    static func view(dto: MoviesCoordinatorDTO? = nil) -> ContentView {
        let vip = BaseCoordinator.assembly(presenter: Presenter.self,
                                           interactor: Interactor.self)
        let view = ContentView(presenter: vip.presenter)
        return view
    }
}

struct MoviesCoordinatorDTO {
    
}
