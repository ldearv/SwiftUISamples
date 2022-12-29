//
//  ContentView.swift
//  Shared
//
//  Created by wangmeng on 2022/9/8.
//

import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var str = "0"
    @State var n = 0
    var body: some View {
        Text("页码：\(n)")
            .padding()
            .onReceive(timer) { timer in
                //str = timer.description
                n += 1
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

