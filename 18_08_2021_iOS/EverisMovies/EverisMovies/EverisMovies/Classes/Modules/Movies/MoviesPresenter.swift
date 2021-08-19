//
//  MoviesPresenter.swift
//  EverisMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 19/8/21.
//

import Foundation

protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func getDataFromInteractor(data: MoviesBussinesModel)
}


final class MoviesPresenter: BasePresenter, ObservableObject {
    
    // ID
    var interactor: MoviesInteractorInputProtocol? {
        super.baseInteractor as? MoviesInteractorInputProtocol
    }
    
    // Publishers
    @Published var arrayMovies: [ResultViewModel] = []
    @Published var data = Data()
    
    func fetchDataFromItunes(){
        self.interactor?.fetchDataFromItunes(top: "top-movies",
                                             all: "all",
                                             number: "25")
    }
    
    func getImageFromURL(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        let task = URLSession
            .shared
            .dataTask(with: url){ [weak self] data, response, error in
                guard self != nil else { return }
                guard let dataDes = data else { return }
                DispatchQueue.main.async {
                    self?.data = dataDes
                }
            }
        task.resume()
    }
    
    
}

extension MoviesPresenter: MoviesInteractorOutputProtocol{
    func getDataFromInteractor(data: MoviesBussinesModel) {
        self.arrayMovies.removeAll()
        self.arrayMovies = data.results ?? []
    }
}
