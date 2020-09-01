//
//  EmojiMemoryGameView.swift
//  Memorize
//  View part in MVVM
//
//  Created by 陳威政 on 2020/8/17.
//  Copyright © 2020 陳威政. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
//    calling viewModel to use the functionality
    var viewModel: EmojiMemoryGame
    let screenSize: CGRect = UIScreen.main.bounds

    var body: some View {
        HStack {
            // ForEach can only used in `identifiable` array
            ForEach(viewModel.cards) { card in
                CardView(card: card, numOfCard: self.viewModel.cards.count, scale: self.screenSize.width > self.screenSize.height ? self.screenSize.height : self.screenSize.width).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(viewModel.cards.count <= 4 ? Font.largeTitle : Font.system(size: 32))
    }
}

// ***** Transform the old code into separate code block *****
struct CardView: View {
    var card: MemoryGame<String>.Card
    var numOfCard: Int
    var scale: CGFloat
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
            RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
        .frame(width: scale/CGFloat(numOfCard*2+4)*2, height: scale/CGFloat(numOfCard*2+4)*3)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
