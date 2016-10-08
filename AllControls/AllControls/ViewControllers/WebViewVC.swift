//
//  WebViewVC.swift
//  AllControls
//
//  Created by F J Castañeda Ramos on 10/8/16.
//  Copyright © 2016 HackInstitute. All rights reserved.
//

import UIKit

class WebViewVC: UIViewController {

    @IBOutlet weak var wvWebView:UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "http://www.hackinstitute.mx/"
        if let url = URL(string: urlString){
            let request = URLRequest(url: url)
            wvWebView.loadRequest(request)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension WebViewVC:UIWebViewDelegate{
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
