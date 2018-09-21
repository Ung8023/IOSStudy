//
//  ViewController.swift
//  WebViewSample
//
//  Copyright © 2018年 ung8023. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screen = UIScreen.main.bounds
        
        //按钮栏
        //按钮栏宽度
        let buttonBarWidth: CGFloat = 316
        let buttonBar = UIView(frame: CGRect(x: (screen.size.width - buttonBarWidth) / 2, y: 20, width: buttonBarWidth, height: 30))
        self.view.addSubview(buttonBar)
        
        //添加LoadHtmlString按钮
        let buttonLoadHtmlString = UIButton(type: UIButtonType.system)
        buttonLoadHtmlString.setTitle("LoadHtmlString", for: UIControlState.normal)
        buttonLoadHtmlString.frame = CGRect(x: 0, y: 0, width: 117, height: 30)
        //指定事件处理方法
        buttonLoadHtmlString.addTarget(self, action: #selector(ViewController.testLoadHtmlString(sender:)), for: UIControlEvents.touchUpInside)
        buttonBar.addSubview(buttonLoadHtmlString)
        
        //添加LoadData按钮
        let buttonLoadData = UIButton(type: UIButtonType.system)
        buttonLoadData.setTitle("LoadData", for: UIControlState.normal)
        buttonLoadData.frame = CGRect(x: 137, y: 0, width: 67, height: 30)
        //指定事件处理方法
        buttonLoadData.addTarget(self, action: #selector(ViewController.testLoadData(sender:)), for: UIControlEvents.touchUpInside)
        buttonBar.addSubview(buttonLoadData)
        
        //添加LoadRequest按钮
        let buttonLoadRequest = UIButton(type: UIButtonType.system)
        buttonLoadRequest.setTitle("LoadRequest", for: UIControlState.normal)
        buttonLoadRequest.frame = CGRect(x: 224, y: 0, width: 92, height: 30)
        //指定事件处理方法
        buttonLoadRequest.addTarget(self, action: #selector(ViewController.testLoadRequest(sender:)), for: UIControlEvents.touchUpInside)
        buttonBar.addSubview(buttonLoadRequest)
        
        //添加WKWebView
        self.webView = WKWebView(frame: CGRect(x: 0, y: 60, width: screen.size.width, height: screen.size.height-80))
        self.view.addSubview(webView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func testLoadHtmlString(sender: Any) {
        
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let bundleUrl = URL.init(fileURLWithPath: Bundle.main.bundlePath)
        
        do {
            let html = try String(contentsOfFile: htmlPath!, encoding: String.Encoding.utf8)
            self.webView.loadHTMLString(html as String, baseURL: bundleUrl)
        }catch let err as NSError {
            NSLog(err.description)
        }
    }

    @objc func testLoadData(sender: Any) {
        let htmlPath = Bundle.main.path(forResource: "index", ofType: "html")
        let bundleUrl = URL.init(fileURLWithPath: Bundle.main.bundlePath)
        let htmlData = NSData(contentsOfFile: htmlPath!)
        
        self.webView.load(htmlData! as Data, mimeType: "html/text", characterEncodingName: "utf-8", baseURL: bundleUrl)
        
    }
    
    @objc func testLoadRequest(sender: Any) {
        let url = NSURL(string: "https://www.baidu.com")
        let request = NSURLRequest(url: url! as URL)
        self.webView.load(request as URLRequest)
        self.webView.navigationDelegate = self
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        NSLog("开始加载")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        NSLog("内容开始返回")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        NSLog("加载完成")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        NSLog("加载失败 Error： %s", error.localizedDescription)
    }
}


