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
        
        
        let baseUrl = Constants.URL.baseUrl
        let endpoint = "\(baseUrl)\(dto.endpoint)"
        let urlEnpoint = URL(string: endpoint)!
        
        var urlRequest = URLRequest(url: urlEnpoint)
        let headers = AppCoordinator.defaultHTTPHeader
        headers.forEach { (key, value) in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        urlRequest.httpMethod = dto.method.rawValue
        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: dto.param!, options: [])
        
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

