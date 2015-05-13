//
//  ViewController.swift
//  MetaTagWebViewInjection
//
//  Created by Jason Garrett on 5/13/15.
//  Copyright (c) 2015 jg. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

   // !! Edit this!
   let url = "https://www.google.com"
   
   @IBOutlet weak var webView: UIWebView!
   
   override func viewDidLoad() {
      
      super.viewDidLoad()
      
      webView.delegate = self
      webView.loadRequest(NSURLRequest(URL: NSURL(string: url)!))
      
   }

   
   func webViewDidFinishLoad(webView: UIWebView){
      
      let javascriptString = "var meta = document.createElement('meta'); meta.setAttribute( 'name', 'viewport' ); meta.setAttribute( 'content', 'width = device-width, initial-scale = 5.0, user-scalable = yes' ); document.getElementsByTagName('head')[0].appendChild(meta)"
      
      if let result = webView.stringByEvaluatingJavaScriptFromString(javascriptString) {
         showAlert("Yeah!", message: "I think it worked!")
      } else {
         showAlert("Ooops!", message: "Something went wrong injecting the tag!")
      }
      
   }
   
   func showAlert(title:String, message:String){
      
         let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
         alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
         self.presentViewController(alert, animated: true, completion: { () -> Void in
            
         })
         
      
   }


}

