//
//  WebView.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/8.
//
// 作用：调用webView显示网页内容
// 来源：https://blog.csdn.net/lovechris00/article/details/121414404
// 作者：未知，转载者：伊织code
// 源地址：https://medium.com/@mdyamin/swiftui-mastering-webview-5790e686833e

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url:URL?
    func makeUIView(context:Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView:WKWebView, context: Context) {
        let request = URLRequest(url: url ?? URL(string: "https://blog.csdn.net/lovechris00/article/details/121414404")!)
        uiView.load(request)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            
            WebView(url: URL(string:"https://blog.csdn.net/lovechris00/article/details/121414404"))
        }
    }
}
