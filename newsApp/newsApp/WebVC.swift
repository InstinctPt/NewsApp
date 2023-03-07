//
//  WebVC.swift
//  newsApp
//
//  Created by Acesso Leandro MP on 07/03/2023.
//

import UIKit
import WebKit

class WebVC: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webKit: WKWebView!
    var url: String = ""
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        webKit.load(URLRequest(url: URL(string: url)!))
        webKit.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
