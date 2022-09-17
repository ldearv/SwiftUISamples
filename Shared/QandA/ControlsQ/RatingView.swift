//
//  RatingView.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/17.
//
// 作者:╰つ栺尖篴夢ゞ
//版权声明：本文为博主原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接和本声明。
//本文链接：https://blog.csdn.net/Forever_wj/article/details/121892092

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text("label")
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}


struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        @State var rating = 4
        return RatingView(rating: $rating)
    }
}
