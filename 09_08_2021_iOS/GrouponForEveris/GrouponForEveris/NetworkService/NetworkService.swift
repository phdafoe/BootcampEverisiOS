//
//  NetworkService.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/8/21.
//

import Foundation

protocol NetworkServiceProtocol {
    func requestGeneric<M: Decodable>(dto: RequestDTO,
                                      entityClass: M.Type,
                                      completionHandler: @escaping (M?) -> (),
                                      failure: @escaping (NetworkError) -> ())
}


class NetworkService: NetworkServiceProtocol {
    
    func requestGeneric<M>(dto: RequestDTO,
                           entityClass: M.Type,
                           completionHandler: @escaping (M?) -> (),
                           failure: @escaping (NetworkError) -> ()) where M : Decodable {
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        let baseUrl = URLEndpoint.baseUrl
        let endpoint = "\(baseUrl)\(dto.endpoint)"
        let urlEnpoint = URL(string: endpoint)!
        
        var urlRequest = URLRequest(url: urlEnpoint)
        let headers = AppCoordinator.defaultHTTPHeader
        headers.forEach { (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        session.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            guard self != nil else { return }
            
            if let errorDes = error {
                failure(NetworkError(error: errorDes))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                failure(NetworkError(status: .badServerResponse))
                return
            }
            guard let dataDes = data else {
                failure(NetworkError(status: .noContent))
                return
            }
            
            do {
                let jsonData = try JSONDecoder().decode(entityClass.self, from: dataDes)
                completionHandler(jsonData)
            } catch {
                failure(NetworkError(status: .resourceUnavailable))
            }
        }
        .resume()
        session.finishTasksAndInvalidate()
        
        
    }
    
  
}
