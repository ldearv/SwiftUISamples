//
//  WebView.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/8.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url:URL?
    func makeUIView(context:Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView:WKWebView, context: Context) {
        let request = URLRequest(url: url ?? URL(string: "https://www.jianshu.com/techareas/ios")!)
        uiView.load(request)
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            
            WebView(url: URL(string:"https://www.jianshu.com/techareas/ios"))
        }
    }
}
