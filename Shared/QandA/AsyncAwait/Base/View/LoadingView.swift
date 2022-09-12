//
//  LoadingView.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/12.
//
// 作用：演示SwiftUI3.0 MVVM & Async/Await项目结构最佳实践
// 作者：tundsdev
// 来源：https://youtu.be/wRmaiEPk03Y

import SwiftUI

struct LoadingView: View {
    
    let text: String
    
    var body: some View {
        VStack(spacing: 8) {
            ProgressView()
            Text(text)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(text: "Loading...")
    }
}
