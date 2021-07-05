//
//  VKLoginPageViewController.swift
//  VK Client. Web interaction practice
//
//  Created by Aleksandr Malinin on 25.06.2021.
//

import UIKit
import WebKit
import Alamofire


class VKLoginPageViewController: UIViewController {
    
//    @IBOutlet weak var backGround: UIView!
//
//    @IBOutlet weak var VKLabel: UILabel!
    
    @IBOutlet weak var webview: WKWebView! {
        didSet {
            webview.navigationDelegate = self
        }
    }
    
    var urlComponents = URLComponents()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        backGround.backgroundColor = #colorLiteral(red: 0.1722629964, green: 0.5988544822, blue: 0.9722792506, alpha: 1)
//        VKLabel.text = "VK"
//        VKLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        VKLabel.font = UIFont(name: "Arial-BoldMT", size: 32.0)
        
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7888664"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "friends,photos,groups,notes"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131")]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webview.load(request)
    }
}


extension VKLoginPageViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }

        
        let params = fragment.components(separatedBy: "&").map{$0.components(separatedBy: "=")}.reduce([String:String]()){empty_dict,param in
            var dict = empty_dict
            let key = param[0]
            let value = param[1]
            dict[key] = value
            return dict
        }

        
        let token = params["access_token"]
        let userid = params["user_id"]
        
        
        if let tokenString = token, let useridString = userid {
            saveUserInfo(receivedUserId: useridString,receivedToken: tokenString)}
        
        
        decisionHandler(.cancel)
        toNextScreen()
    }
}


extension VKLoginPageViewController {
    func saveUserInfo(receivedUserId userId: String, receivedToken token: String) -> Void {
        Singleton.shared.userId = userId
        Singleton.shared.token = token
    }
}


extension VKLoginPageViewController {
    func toNextScreen(){
        performSegue(withIdentifier: "ToMainScreen", sender: nil)
    }
}







    
    
    


