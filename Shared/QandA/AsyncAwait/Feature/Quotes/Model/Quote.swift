//
//  Quote.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/12.
//
// 作用：演示SwiftUI3.0 MVVM & Async/Await项目结构最佳实践
// 作者：tundsdev
// 来源：https://youtu.be/wRmaiEPk03Y

import Foundation

struct Quote: Decodable {
    let anime: String
    let character: String
    let quote: String
}

extension Quote {
    static let dummyData: [Quote] = [
        Quote(anime: "Anime 1", character: "Character 1", quote: "Random Quote 1"),
        Quote(anime: "Anime 2", character: "Character 2", quote: "Random Quote 2"),
        Quote(anime: "Anime 3", character: "Character 3", quote: "Random Quote 3"),
        Quote(anime: "Anime 4", character: "Character 4", quote: "Random Quote 4"),
        Quote(anime: "Anime 5", character: "Character 5", quote: "Random Quote 5"),
    ]
}
