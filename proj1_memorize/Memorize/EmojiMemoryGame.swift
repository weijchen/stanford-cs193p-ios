//
//  EmojiMemoryGame.swift
//  Memorize
//  View Model part in MVVM
//
//  Created by 陳威政 on 2020/8/22.
//  Copyright © 2020 陳威政. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    // MARK: used as an open door to MemoryGame class -> has goods and bads (default as public)
    @Published private(set) var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        var emojis: Array<String> = ["👻", "🎃", "🕷", "💀", "🗿"]
        emojis.shuffle()
        let numOfPairs = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairsOfCards: numOfPairs) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
        // we can rewrite this one-line codes as 'model.cards'
    }
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
