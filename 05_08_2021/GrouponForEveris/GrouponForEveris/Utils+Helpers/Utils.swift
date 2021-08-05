//
//  Utils.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 5/8/21.
//

import Foundation
import UIKit

protocol ReuseIdentifierView: AnyObject {
    static var defaultReuseIdentifierView: String { get }
}

extension ReuseIdentifierView where Self: UIView {
    static var defaultReuseIdentifierView: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

protocol ReuseIdentifierViewController: AnyObject {
    static var defaultReuseIdentifierViewController: String { get }
}

extension ReuseIdentifierViewController where Self: UIViewController {
    static var defaultReuseIdentifierViewController: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

struct RequestDTO {
    
    var param: [String: AnyObject]?
    var arraParams: [[String: AnyObject]]?
    var method: HTTPMethods
    var endpoint: String
    
    init(param: [String: AnyObject]?, method: HTTPMethods, endpoint: String) {
        self.param = param
        self.method = method
        self.endpoint = endpoint
    }
    
    init(arraParams: [[String: AnyObject]]?, method: HTTPMethods, endpoint: String){
        self.arraParams = arraParams
        self.method = method
        self.endpoint = endpoint
    }
    
}



struct URLEndpoint {
    
    static let baseUrl = "https://cupon-for-ever.herokuapp.com/"
    static let endpointGrouponList = "grouponList"
    static let endpointGrouponLegales = "grouponLegales"
    static let bearerHeroku = "Bearer 123456789"
    
   
}

