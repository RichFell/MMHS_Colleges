//
//  WebViewController.swift
//  MMHS_Colleges
//
//  Created by Mobile Makers Academy on 7/27/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate
{
    var college : College!

    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        webView.delegate = self

        goToWebPage(college.webpage)

        navigationItem.title = college.name
    }

    func webViewDidStartLoad(webView: UIWebView!)
    {
        spinner.startAnimating()
    }

    func webViewDidFinishLoad(webView: UIWebView!)
    {
        spinner.stopAnimating()
    }

    func webView(webView: UIWebView!, didFailLoadWithError error: NSError!)
    {
        spinner.stopAnimating()
    }

    func goToWebPage(webpage: String)
    {
        let url = NSURL(string: webpage)
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }


}
