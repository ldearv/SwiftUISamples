//
//  TabBarView.swift
//  SwiftUISamples (iOS)
//
//  Created by wangmeng on 2022/9/8.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {

        TabView {
            ControlsView()
                .tabItem {
                    Image(systemName: "switch.2")
                    Text("SwiftUI控件")
                }
            ThreeLibView()
                .tabItem{
                    Image(systemName: "3.square")
                    Text("第三方库")
                }
            
            SwiftSyntaxView()
                .tabItem {
                    Image(systemName: "curlybraces.square")
                    Text("Swift语法")
                }
            QandAView()
                .tabItem {
                    Image(systemName: "questionmark.app")
                    Text("Q&A")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
