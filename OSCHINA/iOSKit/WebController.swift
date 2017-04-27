//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/9/3.
//

import WebKit

class WebController: BaseController {
    
    // see: https://www.natashatherobot.com/swift-magic-public-getter-private-setter/
    private(set) var webView: WKWebView!
    
    var urlStr: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)
        webView.navigationDelegate = self
        webView.uiDelegate = self
        guard let url = URL(string: urlStr) else {
            fatalError("urlStr can't be nil")
        }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

extension WebController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = title ?? webView.title
    }
}

extension WebController: WKUIDelegate {

     func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
         completionHandler()
    }

     func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        webView.load(navigationAction.request)
        return nil
    }

}
