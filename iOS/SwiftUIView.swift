//
//  SwiftUIView.swift
//  SwiftUISamples (iOS)
//
//  Created by wangmeng on 2022/10/8.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var now = Date()
    
    var body: some View {
//        RefreshableScrollView(onRefresh: { done in
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                self.now = Date()
//                done()
//            }
//        }) {
//            VStack {
//                ForEach(1..<20) {
//                    Text("\(Calendar.current.date(byAdding: .hour, value: $0, to: now)!)")
//                        .padding(.bottom, 10)
//                }
//            }.padding()
//        }
        
        RefreshableScrollView(onRefresh: { done in
          DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.now = Date()
            done()
          }
        },
        progress: { state in // HERE
           if state == .waiting {
               Text("Pull me down...")
           } else if state == .primed {
               Text("Now release!")
           } else {
               Text("Working...")
           }
        }) {
          HStack {
            ForEach(1..<20) {
              Text("\(Calendar.current.date(byAdding: .hour, value: $0, to: now)!)")
                 .padding(.bottom, 10)
             }
           }.padding()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
