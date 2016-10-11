//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/9/3.
//

import WebKit

class WebController: BaseController {
    var webView: WKWebView!
    var urlStr: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)
        webView.navigationDelegate = self
        webView.UIDelegate = self
        guard let url = NSURL(string: urlStr) else {
            fatalError("urlStr can't be nil")
        }
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
}

extension WebController: WKNavigationDelegate {

    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.Allow)
    }
}

extension WebController: WKUIDelegate {

     func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void) {
         completionHandler()
    }

     func webView(webView: WKWebView, createWebViewWithConfiguration configuration: WKWebViewConfiguration, forNavigationAction navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        webView.loadRequest(navigationAction.request)
        return nil
    }
}
