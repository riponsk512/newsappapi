//
//  DescriptionViewController.swift
//  NewsApp
//
//  Created by Ripon sk on 01/06/22.
//

import UIKit
import WebKit
class DescriptionViewController: UIViewController {
    
    @IBOutlet weak var wkwebview: WKWebView!
    let indicator = UIActivityIndicatorView(style: .whiteLarge)
    var decriptionurl:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        wkwebview.navigationDelegate = self
loadwebview()
    }
    func loadwebview(){
        indicator.tintColor = .blue
     wkwebview = WKWebView()
        self.view = wkwebview
        let url = URL(string: decriptionurl)
        wkwebview.load(URLRequest(url: url!))
        wkwebview.allowsBackForwardNavigationGestures = true
      
        
        
        
    }
    
}
extension DescriptionViewController:WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        indicator.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
}
