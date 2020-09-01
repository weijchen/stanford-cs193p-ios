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
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
        .padding(5)
        }
            .padding()
            .foregroundColor(Color.orange)
    }
}

// ***** Transform the old code into separate code block *****
struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    // seperate body into var and func to solve `self.` problem
    func body(for size: CGSize) -> some View {
        ZStack {
           if card.isFaceUp {
               RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
               RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
               Text(card.content)
           } else {
            if !card.isMatched {
               RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
           }
       }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawling Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
