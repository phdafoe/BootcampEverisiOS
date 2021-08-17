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
import UIKit
import SafariServices

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

class Utils {
    
    static func showSafari(url: String) -> SFSafariViewController? {
        guard let url = URL(string: url),
              UIApplication.shared.canOpenURL(url)
        else { return nil }
        
        let safari: SFSafariViewController = SFSafariViewController(url: url)
        safari.preferredControlTintColor = CustomColor.color1.uiColor
        
        return safari
    }
}

class ShadowView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.shadow(color: UIColor.black.withAlphaComponent(0.1),
                    offset: CGSize(width: 0, height: 0),
                    radius: 8.0)
    }
}

extension UIView {
    
    func shadow(color: UIColor,
                offset: CGSize = CGSize.zero,
                radius: CGFloat,
                opacity: Float = 1.0) {
        
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds,
                                             cornerRadius: self.layer.cornerRadius).cgPath
    }
}

protocol ProviderParamsDTO: Codable {}

extension ProviderParamsDTO {
    
    func encodeData() -> [String: AnyObject] {
        guard let jsonData = try? JSONEncoder().encode(self),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: AnyObject]
            else { return [String: AnyObject]() }

        return json
    }
    
}


