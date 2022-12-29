//
//  BannerDetailView.swift
//  SwiftUISamples (iOS)
//
//  Created by wangmeng on 2022/9/24.
//

import SwiftUI

struct BannerDetailView: View {
    
    let imageName: String

    var body: some View {

        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {

                    // 图片名称
                    Text(self.imageName)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.heavy)
                        .padding(.bottom, 30)

                    // 描述文字
                    Text("要想在一个生活圈中生活下去，或者融入职场的氛围，首先你要学习这个圈子的文化和发展史，并尝试用这个圈子里面的“话术”和他们交流，这样才能顺利地融入这个圈子。")
                        .padding(.bottom, 40)

                    // 按钮
                    Button(action: {

                    }) {

                        Text("知道了")
                            .font(.system(.headline, design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
                .padding()
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
                .background(Color.white)
                .cornerRadius(15)
            }
        }
    }
}

struct BannerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BannerDetailView(imageName: imageModel.dummyData[0].imageName)
    }
}

//-----------------------------------
//©著作权归作者所有：来自51CTO博客作者文如秋雨的原创作品，请联系作者获取转载授权，否则将追究法律责任
//SwiftUI极简教程26:构建一个Banner图片轮播（下）
//https://blog.51cto.com/u_15768990/5629106
