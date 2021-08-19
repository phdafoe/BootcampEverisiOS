//
//  MoviesInteractor.swift
//  EverisMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 19/8/21.
//

import Foundation

protocol MoviesInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataFromItunes(top: String, all: String, number: String)
}

final class MoviesInteractor: BaseInteractor {
    
    // ID
    weak var presenter: MoviesInteractorOutputProtocol? {
        super.basePresenter as? MoviesInteractorOutputProtocol
    }
    
    let provider: MoviesProviderProtocol = MoviesProvider()
    
    private func transformDataToMoviesBussinesModel(data: MoviesServerModel) -> MoviesBussinesModel {
        var arrayResultViewModel = [ResultViewModel]()
        if let dataDes = data.feed?.results?.count {
            for item in 0..<dataDes {
                let model = ResultViewModel(artistName: data.feed?.results?[item].artistName ?? "",
                                           id: data.feed?.results?[item].id ?? "",
                                           name: data.feed?.results?[item].name ?? "",
                                           artworkUrl100: data.feed?.results?[item].artworkUrl100 ?? "",
                                           url: data.feed?.results?[item].url ?? "")
                arrayResultViewModel.append(model)
            }
        }
        
        let object = MoviesBussinesModel(results: arrayResultViewModel)
        return object
    }
    
}

extension MoviesInteractor: MoviesInteractorInputProtocol{
    func fetchDataFromItunes(top: String, all: String, number: String){
        self.provider.fetchMovies(top: top,
                                  all: all,
                                  number: number) { [weak self] (result) in
            guard self != nil else { return }
            switch result {
            case .success(let response):
                if let data = self?.transformDataToMoviesBussinesModel(data: response){
                    self?.presenter?.getDataFromInteractor(data: data)
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
