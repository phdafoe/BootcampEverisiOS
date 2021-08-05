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
