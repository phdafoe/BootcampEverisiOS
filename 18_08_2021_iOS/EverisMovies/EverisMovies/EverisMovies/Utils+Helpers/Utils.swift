//
//  Utils.swift
//  CiceSports
//
//  Created by cice on 26/05/2021.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}


public enum Environment: Int {
    case DEV = 0
    case PRE = 1
    case PRO = 2
}

struct RequestDTO {
    var params: [String: Any]?
    var arrayParams: [[String: Any]]?
    var method: HTTPMethods
    var urlContext: URLEndpoint.BaseURLContext
    var endpoint: String
    

    init(params: [String: Any]?, method: HTTPMethods, endpoint: String, urlContext: URLEndpoint.BaseURLContext) {
        self.params = params
        self.method = method
        self.urlContext = urlContext
        self.endpoint = endpoint
        self.urlContext = urlContext
    }
    

    init(arrayParams:[[String: Any]]?, method: HTTPMethods, endpoint: String, urlContext: URLEndpoint.BaseURLContext) {
        self.arrayParams = arrayParams
        self.method = method
        self.urlContext = urlContext
        self.endpoint = endpoint
        self.urlContext = urlContext
    }
}

struct URLEndpoint {
    
    #if DEV
    static let environementDefault: Environment = Environment.DEV
    #elseif PRE
    static let environementDefault: Environment = Environment.PRE
    #else
    static let environementDefault: Environment = Environment.PRO
    #endif
    
    public enum BaseURLContext {
        case backend
        case heroku
    }
    
    static let endpointMovies = "movies/%@/%@/%@/explicit.json" // /top-movies/all/25/explicit.json
}

extension URLEndpoint {
    
    static func getUrlBase(urlContext: BaseURLContext) -> String {
        switch urlContext {
        case .backend:
            switch self.environementDefault {
            case .DEV:
                return "https://rss.itunes.apple.com/api/v1/es/"
            case .PRE:
                return "https://rss.itunes.apple.com/api/v1/es/"
            case .PRO:
                return "https://rss.itunes.apple.com/api/v1/es/"
            }
        case .heroku:
            switch self.environementDefault {
            case .DEV:
                return "https://app-herokuapp-des-cloudFirebase.com/"
            case .PRE:
                return "https://app-herokuapp-pre-cloudFirebase.com/"
            case .PRO:
                return "https://app-cicesport-123.herokuapp.com/"
            }
            
        }
    }
}


struct AuthHeroku {
    static let authHeroku = "Bearer 123456789"
}


extension Bundle {
    
    func loadAndDecodeJSON<D: Decodable>(filename: String) throws -> D? {
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        let jsonDecoder = Utils.jsonDecoder
        let decodeModel = try jsonDecoder.decode(D.self, from: data)
        return decodeModel
    }
}

class Utils {
    
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatt)
        return jsonDecoder
    }()
    
    static let dateFormatt: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
}

