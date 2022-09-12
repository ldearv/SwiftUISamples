//
//  QuoteView.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/12.
//
// 作用：演示SwiftUI3.0 MVVM & Async/Await项目结构最佳实践
// 作者：tundsdev
// 来源：https://youtu.be/wRmaiEPk03Y

import SwiftUI

struct QuoteView: View {
    let item: Quote
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "tv")
                    .font(.system(size: 12, weight: .black))
                Text(item.anime)
            }
            
            // NSAttributedString in SwiftUI
            Text(makeAttributedString(title:"Character", label:item.character))
            Text(makeAttributedString(title:"Quotes", label:item.quote))
                .lineLimit(2)
            
        }
        .padding()
        .foregroundColor(.black)
    }
    
    private func makeAttributedString(title: String, label: String) -> AttributedString {
        var string = AttributedString("\(title): \(label)")
        string.foregroundColor = .black
        string.font = .system(size: 16, weight: .bold)
        
        if let range = string.range(of: label) {
            string[range].foregroundColor = .black.opacity(0.8)
            string[range].font = .system(size: 16, weight: .regular)
        }
        return string
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView(item: Quote.dummyData.first!)
    }
}
