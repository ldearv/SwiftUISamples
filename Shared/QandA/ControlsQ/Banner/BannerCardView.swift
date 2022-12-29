//
//  BannerCardView.swift
//  SwiftUISamples (iOS)
//
//  Created by wangmeng on 2022/9/24.
//

import SwiftUI

struct BannerCardView: View {
    let image: String
    let imageName: String
    var body: some View {
        
        ZStack {
            
            GeometryReader { geometry in
                
                Image(systemName: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .cornerRadius(15)
                
                    .overlay(
                        Text(imageName)
                            .font(.system(.headline, design: .rounded))
                            .fontWeight(.heavy)
                            .padding(10)
                            .background(Color.white)
                            .padding([.bottom, .leading])
                            .opacity(1.0)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                    )
            }
        }
    }
}

struct BannerCardView_Previews: PreviewProvider {
    static var previews: some View {
        BannerCardView(image: imageModel.dummyData[0].image, imageName: imageModel.dummyData[0].imageName)
    }
}

struct imageModel: Identifiable {
    var id = UUID()
    var image: String
    var imageName: String
}

extension imageModel {
    static let dummyData = [
        imageModel(image: "seal", imageName: "图片01"),
        imageModel(image: "circle", imageName: "图片02"),
        imageModel(image: "capsule", imageName: "图片03"),
        imageModel(image: "capsule.portrait", imageName: "图片04"),
        imageModel(image: "oval", imageName: "图片05"),
        imageModel(image: "oval.portrait", imageName: "图片06"),
        imageModel(image: "square", imageName: "图片07"),
        imageModel(image: "app", imageName: "图片08"),
        imageModel(image: "rectangle", imageName: "图片09")
    ]
}



//-----------------------------------
//©著作权归作者所有：来自51CTO博客作者文如秋雨的原创作品，请联系作者获取转载授权，否则将追究法律责任
//SwiftUI极简教程24:构建一个Banner图片轮播（上）
//https://blog.51cto.com/u_15768990/5628600
