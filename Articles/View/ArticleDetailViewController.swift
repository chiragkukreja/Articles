//
//  ArticleDetailViewController.swift
//  Articles
//
//  Created by Kukreja, Chirag on 06/07/19.
//  Copyright © 2019 Kukreja, Chirag. All rights reserved.
//

import UIKit
import WebKit

class ArticleDetailViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.startAnimating()
        webView.navigationDelegate = self
        load(urlString)
    }

    /**
     * This func will load the url in webview
     */

    func load(_ urlString: String?) {
        if let str = urlString,  let url = URL(string: str) {
            let request = URLRequest(url: url)
            webView.load(request)
            
        }
    }
}

/**
 * webview navigation delegate
 */
extension ArticleDetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinner.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        spinner.startAnimating()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        spinner.stopAnimating()
    }
}
