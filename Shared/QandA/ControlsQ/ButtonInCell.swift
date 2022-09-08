//
//  ButtonInCell.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/8.
//

import SwiftUI

struct ButtonInCell: View {
    @State private var isRed = false
    var body: some View {
        List {
            Section {
                Button("点我") { isRed.toggle() }
                    .padding(50)
                    .background(isRed ? .red : .orange)
            } header: {
                Text("整个区域 cell 都会响应事件")
            }
            
            Section {
                // button 的主体只有 "点我" 所以只有 "点我" 才能响应事件
                Button("点我") { isRed.toggle() }
                    .padding(50)
                    .background(isRed ? .red : .orange)
                    .buttonStyle(.plain) // 设置button
            } header: {
                Text("只有 Button 文本 \"点我\" 会响应事件")
            }
            
            Section {
                // button 的主体是 label 返回的视图 所以 label 里的视图都能响应事件
                Button { isRed.toggle() } label: {
                    Text("点我")
                        .padding(50)
                        .background(isRed ? .red : .orange)
                }.buttonStyle(.plain)
                
            } header: {
                Text("整个 Button 都会响应事件 🌟🌟🌟🌟🌟")
            }
            
            Section {
                NavigationLink(destination:WebView(url: URL(string:"https://www.jianshu.com/p/4c940917799b"))){
                    VStack {
                        Text("代码作者：xxxixxxx")
                        Text("来源：https://www.jianshu.com/p/4c940917799b")
                        
                    }
                }
            }
        }
    }
}

struct ButtonInCell_Previews: PreviewProvider {
    static var previews: some View {
        ButtonInCell()
    }
}
