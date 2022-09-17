//
//  RatingResultView.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/17.
//
// 作者:╰つ栺尖篴夢ゞ
//版权声明：本文为博主原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接和本声明。
//本文链接：https://blog.csdn.net/Forever_wj/article/details/121892092
// 在原作者基础上增加了结果是小数的显示


import SwiftUI

struct RatingResultView: View {
    @Binding var rating: Double
    //var rating: Double
    var label = ""
    var maximumRating = 5
    
    var offImage = Image(systemName: "star")
    var halfImage = Image(systemName: "star.leadinghalf.filled")
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var canTap = true
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text("label")
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(rating < Double(number) ? rating > Double(number - 1) ? onColor : offColor : onColor)
                    .onTapGesture {
                        if canTap {
                            rating = Double(number)
                        }
                    }
            }
        }
    }
    func image(for number: Int) -> Image {
        if Double(number) > rating {
            if Double(number - 1) < rating {
                return halfImage
            }
            return offImage
        } else {
            return onImage
        }
    }
}


struct RatingResultView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack {
                ForEach(0...25, id: \.self) {score in
                    HStack {
                        Text("\(String(format:"%.1lf", Double(score) * 0.2))")
                        RatingResultView(rating: .constant(Double(score) * 0.2))
                    }
                }
            }
        }
    }
}
