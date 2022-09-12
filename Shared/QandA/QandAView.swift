//
//  QandAView.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/8.
//

import SwiftUI

struct QandAView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination:ButtonInCell()){
                    Text("点击在Cell里的Button，怎样才能不触发整个Cell响应？")
                }
                
                NavigationLink(destination:QuotesScreen()) {
                    Text("MVVM & Async/Await项目结构")
                }
            }
            .navigationTitle(Text("Q & A"))
        }
    }
}

struct QandAView_Previews: PreviewProvider {
    static var previews: some View {
        QandAView()
    }
}
