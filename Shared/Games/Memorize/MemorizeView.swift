//
//  MemorizeView.swift
//  SwiftUISamples (iOS)
//
//  Created by wangmeng on 2022/9/25.
//

import SwiftUI

struct MemorizeView: View {
    @ObservedObject var viewModel: EmojiMemoryViewModel
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: EmojiMemoryViewModel.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content)
            } else {
                shape.fill()
            }
        }
    }
}

struct MemorizeView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryViewModel()
        MemorizeView(viewModel: game)
            .preferredColorScheme(.dark)
        MemorizeView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
