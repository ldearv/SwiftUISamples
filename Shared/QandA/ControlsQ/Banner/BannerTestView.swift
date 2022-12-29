//
//  BannerTestView.swift
//  SwiftUISamples (iOS)
//
//  Created by wangmeng on 2022/9/24.
//

import SwiftUI

struct BannerTestView: View {
    
    @State var currentIndex = 0
    @GestureState var dragOffset: CGFloat = 0
    @State private var offset: CGFloat = .zero
    @State var isShowDetailView = false

    var body: some View {

        ZStack {

            //首页轮播图
            GeometryReader { outerView in
                HStack(spacing: 0) {
                    ForEach(imageModel.dummyData.indices, id: \.self) { index in
                        GeometryReader { innerView in
                            BannerCardView(image: imageModel.dummyData[index].image, imageName: imageModel.dummyData[index].imageName)

                                //如果点击就图片就移上去
                                .offset(y: self.isShowDetailView ? -innerView.size.height * 0.3 : 0)
                        }

                        //如果点击图片两边就不留边距
                        .padding(.horizontal, self.isShowDetailView ? 0 : 20)
                        .opacity(self.currentIndex == index ? 1.0 : 0.7)

                        //如果点击就图片调整大小
                        .frame(width: outerView.size.width, height: self.currentIndex == index ? (self .isShowDetailView ? outerView.size.height : 250) : 200)

                        //点击进入详情页
                        .onTapGesture {
                            self.isShowDetailView = true
                        }
                    }
                }
                .frame(width: outerView.size.width, height: outerView.size.height, alignment: .leading)
                .offset(x: -CGFloat(self.currentIndex) * outerView.size.width)
                .offset(x: self.dragOffset)

                // 拖动事件
                .gesture(

                    //如果没有被点击
                    !self.isShowDetailView ?

                    DragGesture()
                        .updating(self.$dragOffset, body: { value, state, transaction in
                            state = value.translation.width
                        })
                        .onEnded({ value in
                            let threshold = outerView.size.width * 0.65
                            var newIndex = Int(-value.translation.width / threshold) + self.currentIndex
                            newIndex = min(max(newIndex, 0), imageModel.dummyData.count - 1)
                            self.currentIndex = newIndex
                        })

                    : nil
                )
            }
            .animation(.interpolatingSpring(mass: 0.6, stiffness: 100, damping: 10, initialVelocity: 0.3),value: offset)

            //详情页
            if self.isShowDetailView {

                BannerDetailView(imageName: imageModel.dummyData[currentIndex].imageName)
                    .offset(y: 200)
                    .transition(.move(edge: .bottom))
                    .animation(.interpolatingSpring(mass: 0.5, stiffness: 100, damping: 10, initialVelocity: 0.3),value: offset)

                //关闭按钮
                Button(action: {
                    self.isShowDetailView = false
                }) {

                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                        .opacity(0.7)
                        .contentShape(Rectangle())
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                .padding(.trailing)
            }
        }
    }
}

struct BannerTestView_Previews: PreviewProvider {
    static var previews: some View {
        BannerTestView()
    }
}

//-----------------------------------
//©著作权归作者所有：来自51CTO博客作者文如秋雨的原创作品，请联系作者获取转载授权，否则将追究法律责任
//SwiftUI极简教程26:构建一个Banner图片轮播（下）
//https://blog.51cto.com/u_15768990/5629106
