//
//  QuotesScreen.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/12.
//
// 作用：演示SwiftUI3.0 MVVM & Async/Await项目结构最佳实践
// 作者：tundsdev
// 来源：https://youtu.be/wRmaiEPk03Y

import SwiftUI

struct QuotesScreen: View {
    
    @StateObject private var vm = QuotesViewModelImpl(service: QuotesServiceImpl())
    
    var body: some View {
        VStack {
            Text("代码作者：tundsdev")
            Text("来源：https://youtu.be/wRmaiEPk03Y")
            Spacer()
            
            Group {
                if vm.quotes.isEmpty {
                    LoadingView(text: "Fetching Quotes")
                } else {
                    List {
                        ForEach(vm.quotes, id: \.anime) { item in
                            QuoteView(item: item)
                        }
                    }
                }
            }
            .task {
                await vm.getRandomQuotes()
            }
            Spacer()
        }
    }
}

struct QuotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuotesScreen()
    }
}
