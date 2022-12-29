//
//  DCPCustomLoopView.swift
//  SwiftUISamples (iOS)
//
//  Created by wangmeng on 2022/9/24.
//

import SwiftUI

struct DCPCustomLoopView: View {
    //图片地址
    @State var urls : [String] = [String]()
    
    @State var center_index : NSInteger = 1
    /// SwiftUI对定时器的简化，可以进去看看具体参数的定义
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    //当前显示的位置索引,
    @State var currentIndex: Int = 0
    //item的间距
    @State var spacing: CGFloat = 0
    
    /// 是否需要动画
    @State var isAnimation: Bool = true
    /// 拖拽的偏移量
    @State var dragOffset: CGFloat = .zero
    /// 图片高
    @State var itemHeight : CGFloat = 150
    /// 图片宽
    @State var itemWidth : CGFloat = UIScreen.main.bounds.size.width
    //圆角
    @State var radius : CGFloat = 0
    //缩放
    @State var zoom : CGFloat = 1
    //是否循环滚动
    @State var isAuto : Bool = true
    
    
    var body: some View {
        
        /// 单个子视图偏移量 = 单个视图宽度 + 视图的间距
        let currentOffset = CGFloat(center_index) * (itemWidth + spacing)

        GeometryReader(content: { geometry in

            HStack(spacing: spacing){

                ForEach(0..<3){ index in

                    if index == 0{
                        Image(self.urls[self.currentIndex==0 ? self.urls.count - 1 : self.currentIndex-1])
                            .resizable()
                            /// 自己尝试一下.fill和.fit
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width,
                                   height: index == center_index ? geometry.size.height:geometry.size.height*zoom)
                            .clipped() // 裁减
                            .cornerRadius(radius)
                    }else if index == 1{
                        Image(self.urls[self.currentIndex])
                            .resizable()
                            /// 自己尝试一下.fill和.fit
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width,
                                   height: index == center_index ? geometry.size.height:geometry.size.height*zoom)
                            .clipped() // 裁减
                            .cornerRadius(radius)
                    }else{
                        Image(self.urls[self.currentIndex==self.urls.count - 1 ? 0 : self.currentIndex+1])
                            .resizable()
                            /// 自己尝试一下.fill和.fit
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width,
                                   height: index == center_index ? geometry.size.height:geometry.size.height*zoom)
                            .clipped() // 裁减
                            .cornerRadius(radius)
                    }


                }

            }
            .frame(width:geometry.size.width,
                    height:geometry.size.height,alignment:.leading)
            .offset(x: dragOffset - currentOffset)
            .gesture(dragGesture)
            /// 绑定是否需要动画
            //.animation(isAnimation ? .spring() : .none)
            .animation(.spring(), value: isAnimation)
            .onChange(of: currentIndex, perform: { value in
                
                isAnimation = false
                center_index = 1
                
            })
            /// 对定时器的监听
            .onReceive(timer, perform: { _ in
                if isAuto{
                    isAnimation = true
                    center_index += 1
                    currentIndex += 1
                    currentIndex = currentIndex > self.urls.count-1 ? 0 : currentIndex
                }
            })

        })
        .frame(width: itemWidth,
                 height: itemHeight)
        
        
    }
}


extension DCPCustomLoopView{
    /// 定义拖拽手势
    private var dragGesture: some Gesture{
        
        DragGesture()
            /// 拖动改变
            .onChanged {
                isAnimation = true
                dragOffset = $0.translation.width
                
            }
            /// 结束
            .onEnded {
                
                dragOffset = .zero
                //偏移
                let offset = itemWidth/3
                /// 拖动右滑，偏移量增加，显示 index 减少
                if $0.translation.width > offset{
                    center_index = 0
                    currentIndex -= 1
                    currentIndex = currentIndex < 0 ? self.urls.count-1 : currentIndex

                }
                /// 拖动左滑，偏移量减少，显示 index 增加
                if $0.translation.width < -offset{
                    center_index = 2
                    currentIndex += 1
                    currentIndex = currentIndex > self.urls.count-1 ? 0 : currentIndex

                }
                
            }
        
    }
    
}

struct DCPCustomLoopView_Previews: PreviewProvider {
    static var previews: some View {
        DCPCustomLoopView()
    }
}

// https://zhuanlan.zhihu.com/p/388135153
