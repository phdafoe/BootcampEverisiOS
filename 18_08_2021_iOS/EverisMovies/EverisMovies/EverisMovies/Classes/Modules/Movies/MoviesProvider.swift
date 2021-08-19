//
//  MoviesProvider.swift
//  EverisMovies
//
//  Created by Andres Felipe Ocampo Eljaiek on 19/8/21.
//

import Foundation
import Combine

protocol MoviesProviderProtocol {
    
    func fetchMovies(top: String, all: String, number: String, completionHandller: @escaping(Result<MoviesServerModel, NetworkingError>) -> ())
}


final class MoviesProvider {
    
    let networkService: NetworkServiceProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    
}

extension MoviesProvider: MoviesProviderProtocol {
    
    func fetchMovies(top: String, all: String, number: String, completionHandller: @escaping(Result<MoviesServerModel, NetworkingError>) -> ()) {
        
        let arg: [CVarArg] = [top, all, number]
        let endpointComplete = String(format: URLEndpoint.endpointMovies, arguments: arg)
        
        let dto = RequestDTO(params: nil, method: .get, endpoint: endpointComplete, urlContext: .backend)
        
        self.networkService.requestGeneric(dto: dto, entityClass: MoviesServerModel.self)
            .sink { [weak self] (completionTask) in
                guard self != nil else { return }
                switch completionTask {
                case .finished: break
                case .failure(let error):
                    completionHandller(.failure(error))
                }
            } receiveValue: {[weak self] (resultMoviesServerModel) in
                guard self != nil else { return }
                completionHandller(.success(resultMoviesServerModel))
            }
            .store(in: &cancellable)

    }
}
