//
//  WebView.swift
//  SwiftUISamples (macOS)
//
//  Created by wangmeng on 2022/9/12.
//
// 作用：在macOS APP中打开网页
// 作者：The*_*eil,Ahm*_*med
// 来源：https://qa.1r1g.com/sf/ask/4154357441/

/*
 用法示例
 struct BrowserView: View {

     private let browser = WebBrowserView()

     var body: some View {
         HStack {
             browser
                 .onAppear() {
                     self.browser.load(url: URL(string: "https://stackoverflow.com/tags")!)
                 }
         }
         .padding()
     }
 }

 struct ContentView: View {

     @State private var selection = 0

     var body: some View {
         TabView(selection: $selection){
             Text("Email View")
                 .tabItem {
                     Text("Email")
                 }
                 .tag(0)
             BrowserView()
                 .tabItem {
                     Text("Browser")
                 }
                 .tag(1)
         }
         .padding()
     }
 }
 
 
 
 Ahm*_*med  11

 我在使用 SwiftUI 的 MacOS 应用程序中遇到了与 WKWebView 完全相同的问题。

 对我有用的解决方案是使用 GeometryReader 来获取确切的高度，并将 web 视图放在滚动视图中（我相信它与布局优先级计算有关，但还无法触及它的核心） .

 这是对我有用的片段，也许它也适用于你

 GeometryReader { g in
     ScrollView {
         BrowserView().tabItem {
             Text("Browser")
         }
         .frame(height: g.size.height)
         .tag(1)

     }.frame(height: g.size.height)
 }
 */

import SwiftUI
import WebKit

public struct WebView {
    let url:URL?
    private let webView: WKWebView = WKWebView()

    // ...

    public func load(url: URL) {
        webView.load(URLRequest(url: url))
    }

    public class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {

        var parent: WebView

        init(parent: WebView) {
            self.parent = parent
        }

        public func webView(_: WKWebView, didFail: WKNavigation!, withError: Error) {
            // ...
        }

        public func webView(_: WKWebView, didFailProvisionalNavigation: WKNavigation!, withError: Error) {
            // ...
        }

        public func webView(_: WKWebView, didFinish: WKNavigation!) {
            // ...
        }

        public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            // ...
        }

        public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
        }

        public func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            if navigationAction.targetFrame == nil {
                webView.load(navigationAction.request)
            }
            return nil
        }
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
}


#if os(macOS) // macOS Implementation (iOS version omitted for brevity)
extension WebView: NSViewRepresentable {


    public typealias NSViewType = WKWebView

    public func makeNSView(context: NSViewRepresentableContext<WebView>) -> WKWebView {

        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator
        return webView
    }

    public func updateNSView(_ nsView: WKWebView, context: NSViewRepresentableContext<WebView>) {
        let request = URLRequest(url: url ?? URL(string: "https://www.jianshu.com/techareas/ios")!)
        webView.load(request)
    }
}
#endif

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: URL(string:"https://www.jianshu.com/techareas/ios"))
    }
}
