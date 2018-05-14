//
//  ViewController.swift
//  Swift4WebView
//
//  Created by 米山諒 on 2018/05/09.
//  Copyright © 2018 米山諒. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.delegate = self
        let url = URL(string: "https://www.yahoo.co.jp")
        let urlRequest = URLRequest(url: url!)
        webView.loadRequest(urlRequest)
        
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        //インディケーター開始
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        //インディケーター終了
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

