//
//  QuotesViewModel.swift
//  SwiftUISamples
//
//  Created by wangmeng on 2022/9/12.
//
// 作用：演示SwiftUI3.0 MVVM & Async/Await项目结构最佳实践
// 作者：tundsdev
// 来源：https://youtu.be/wRmaiEPk03Y

import Foundation

protocol QuotesViewModel: ObservableObject {
    func getRandomQuotes() async
}

@MainActor
final class QuotesViewModelImpl: QuotesViewModel {
    @Published private(set) var quotes: [Quote] = []
    
    private let service: QuotesService
    
    init(service: QuotesService) {
        self.service = service
    }
    
    func getRandomQuotes() async {
        do {
            self.quotes = try await service.fetchRandomQuotes()
        } catch {
            print(error)
        }
    }
}
