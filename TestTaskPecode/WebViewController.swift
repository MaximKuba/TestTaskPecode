//
//  WebViewController.swift
//  TestTaskPecode
//
//  Created by Maxim Kuba on 21.12.2020.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
  
  @IBOutlet weak var webview: WKWebView!
  var testlink = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    downloadnews(from: testlink)
    
    // Do any additional setup after loading the view.
  }
  func downloadnews(from link: String) {
      guard let url = URL(string: link) else {
          return
      }
      webview.load(URLRequest(url: url))
  }
  
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


