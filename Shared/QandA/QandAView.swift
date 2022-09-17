//
//  QandAView.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/8.
//

import SwiftUI

struct QandAView: View {
    @State var rating = 4
    @State var ratingResult = 3.7
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination:ButtonInCell()){
                    Text("点击在Cell里的Button，怎样才能不触发整个Cell响应？")
                }
                
                NavigationLink(destination:QuotesScreen()) {
                    Text("MVVM & Async/Await项目结构")
                }
                
                NavigationLink(destination:RatingView(rating: $rating)) {
                    Text("Star Rating评分组件")
                }
                
                NavigationLink(destination:RatingResultView(rating: $ratingResult, canTap: false)) {
                    Text("Star Rating评分结果组件")
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
