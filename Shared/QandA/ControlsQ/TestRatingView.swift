//
//  TestRatingView.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/19.
//
// 作者:╰つ栺尖篴夢ゞ
//版权声明：本文为博主原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接和本声明。
//本文链接：https://blog.csdn.net/Forever_wj/article/details/121892092
// 在原作者基础上增加了结果是一位小数的显示

import SwiftUI

struct TestRatingView: View {

    @ObservedObject var viewModel = RatingViewModel()
    
    var body: some View {
        VStack {
            RatingResultView(model: viewModel.resultModel, label: "平均评分：\(String(format:"%.1lf", viewModel.resultModel.rating))", canTap: false, onTap: {_ in})
            Text("有\(viewModel.ratingCount)人参与评分")
            
            List {
                ForEach (0..<3, id: \.self) { index in
                    RatingResultView(model:viewModel.ratingers[index], label: "请评分：", onTap: { rating in
                        viewModel.summitRating(rating: rating, index: index)
                    })
                }
                
                Text("本评分控件原作者：╰つ栺尖篴夢ゞ")
                Text("来源：https://blog.csdn.net/Forever_wj/article/details/121892092")
            }
        }
        .navigationTitle(Text("评分控件Demo"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TestRatingView_Previews: PreviewProvider {
    static var previews: some View {
        TestRatingView()
    }
}


class RatingViewModel : ObservableObject {
    
    @Published var ratingCount: Int = 0
    @Published var resultModel = RatingModel(rating: 0)
    var ratingers = [
        RatingModel(rating: 0),
        RatingModel(rating: 0),
        RatingModel(rating: 0)
    ]
    
    func summitRating(rating: Double, index: Int) {
        if index >= 0 && index < ratingers.count {
            ratingers[index].changeRating(rating: rating)
        }
        var tmpRatingCount = 0.0
        var sumRating = 0.0
        for m in ratingers {
            if m.rating > 0 {
                tmpRatingCount += 1
                sumRating += m.rating
            }
        }
        resultModel.rating = sumRating / tmpRatingCount
        ratingCount = Int(tmpRatingCount)
    }
}

struct RatingModel :Identifiable {
    var id = UUID()
    var rating: Double
    
    mutating func changeRating(rating: Double) {
        self.rating = rating
    }
}
