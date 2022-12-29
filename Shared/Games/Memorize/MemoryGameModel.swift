//
//  MemoryGameModel.swift
//  SwiftUISamples (iOS)
//
//  Created by wangmeng on 2022/9/25.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable {
    
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly }
//        get {
//            let faceUpCardIndices = cards.indices.filter { cards[$0].isFaceUp }
////      =      let faceUpCardIndices = cards.indices.filter { index in cards[index].isFaceUp }
////      =      var faceUpCardIndices = [Int]()
////            for index in cards.indices {
////                if cards[index].isFaceUp {
////                    faceUpCardIndices.append(index)
////                }
////            }
//            return faceUpCardIndices.oneAndOnly
////      =      if faceUpCardIndices.count == 1 {
////                return faceUpCardIndices.first
////            } else {
////                return nil
////            }
//        }
        set { cards.indices.forEach{ cards[$0].isFaceUp = ($0 == newValue) } }
//     =   set { cards.indices.forEach({ cards[$0].isFaceUp = ($0 == newValue) }) }
//     =   set { cards.indices.forEach({ index in cards[index].isFaceUp = (index == newValue) }) }
//     =   set {
//            for index in cards.indices {
//                cards[index].isFaceUp = (index == newValue)
////          =      if index != newValue {
////                    cards[index].isFaceUp = false
////                } else {
////                    cards[index].isFaceUp = true
////                }
//            }
//        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return first
        } else {
            return nil
        }
    }
}
