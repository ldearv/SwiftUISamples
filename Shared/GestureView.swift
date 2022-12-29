//
//  GestureView.swift
//  SwiftUISamples (iOS)
//
//  Created by 王猛 on 2022/10/12.
//

import SwiftUI

struct GestureView: View {

  @State private var dragAmount = CGSize.zero

    var body: some View {

      LinearGradient(gradient: Gradient(colors: [.yellow,.red]), startPoint: .topLeading, endPoint: .bottomTrailing)

        .frame(width: 300, height: 200)

        .clipShape(RoundedRectangle(cornerRadius: 10))

        .offset(dragAmount)

        .gesture(DragGesture().onChanged{

          dragAmount = $0.translation

        }.onEnded{

          _ in

//          withAnimation(.spring()){

//            dragAmount = .zero

//          }

          //dragAmount = .zero

        })

        .animation(.spring().delay(Double(2 / 20)),value: dragAmount)

    }

}

struct GestureView_Previews: PreviewProvider {

    static var previews: some View {

        GestureView()

    }

}
//————————————————
//版权声明：本文为CSDN博主「站在桥上烤冷面」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
//原文链接：https://blog.csdn.net/weixin_45982458/article/details/122217104
