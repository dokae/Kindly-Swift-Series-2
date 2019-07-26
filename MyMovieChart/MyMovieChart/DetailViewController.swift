//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by Park Jae Han on 25/07/2019.
//  Copyright © 2019 Park Jae Han. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet var wv: WKWebView!
    var mvo: MovieVO!
    
    override func viewDidLoad() {
        
        self.wv.navigationDelegate = self
        NSLog("linkurl=\(self.mvo.detail!), title=\(self.mvo.title!)")
        
        let navibar = self.navigationItem
        navibar.title = self.mvo.title
        
        let url = URL(string: (self.mvo.detail!))
        let req = URLRequest(url: url!)
        
        self.wv.load(req)
    }
}

//MARK:- WKNavigationDelegate 프로토콜 구현
extension DetailViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.spinner.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.spinner.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating()
        self.alert("Detail Page Loading Failed") {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating()
        self.alert("Detail Page Loading Failed") {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
}

//MARK:- 경고창 함수 정의
extension UIViewController {

    func alert(_ message: String, onClick: (() -> Void)? = nil) {
        let controller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "OK", style: .cancel) { (_) in
            onClick?()
        })
        DispatchQueue.main.async {
            self.present(controller, animated: true)
        }
    }
}
