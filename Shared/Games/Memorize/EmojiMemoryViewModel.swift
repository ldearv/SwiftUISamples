//
//  EmojiMemoryViewModel.swift
//  SwiftUISamples (iOS)
//
//  Created by wangmeng on 2022/9/25.
//

import SwiftUI

class EmojiMemoryViewModel: ObservableObject {
    typealias Card = MemoryGameModel<String>.Card
    private static let emojis = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🏍", "🚁", "✈️", "🚀", "🦽"]
    
    private static func createMemoryGame() -> MemoryGameModel<String> {
        MemoryGameModel<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
}
