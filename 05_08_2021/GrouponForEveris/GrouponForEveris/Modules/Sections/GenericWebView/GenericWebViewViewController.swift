//
//  GenericWebViewViewController.swift
//  GrouponForEveris
//
//  Created by Andres Felipe Ocampo Eljaiek on 11/8/21.
//

import UIKit
import WebKit

class GenericWebViewViewController: UIViewController {
    
    // MARK: - Variables
    var url: String?
    var myWebView: WKWebView?
    
    // MARK: - Outlets
    
    @IBOutlet weak var myContentWebView: UIView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.loadWebView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        self.title = "Cupon for Ever"
        
        self.myActivityIndicator.isHidden = false
        self.myActivityIndicator.startAnimating()
        
        let contectVC = WKUserContentController()
        let config = WKWebViewConfiguration()
        let preferences = WKWebpagePreferences()
        
        preferences.allowsContentJavaScript = true
        self.myWebView = WKWebView(frame: self.myContentWebView.bounds, configuration: config)
        self.myWebView?.configuration.userContentController = contectVC
        self.myWebView?.navigationDelegate = self
        self.myContentWebView.addSubview(self.myWebView ?? WKWebView())
        
    }
    
    private func loadWebView() {
        self.myWebView?.load(URLRequest(url: URL(string: self.url ?? "")!))
    }
    
    private func loadActiv(show: Bool) {
        if show {
            self.myActivityIndicator.startAnimating()
        } else {
            self.myActivityIndicator.stopAnimating()
        }
        self.myActivityIndicator.isHidden = !show
    }


}

extension GenericWebViewViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.loadActiv(show: true)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.loadActiv(show: false)
    }
}
