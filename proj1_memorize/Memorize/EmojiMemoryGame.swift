//
//  EmojiMemoryGame.swift
//  Memorize
//  View Model part in MVVM
//
//  Created by 陳威政 on 2020/8/22.
//  Copyright © 2020 陳威政. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    // MARK: used as an open door to MemoryGame class -> has goods and bads (default as public)
    private(set) var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    return MemoryGame<String>(numberOfPairsOfCards: 2) { _ in "😂" }   // after shrinking one-line return, last argument is {}, don't care, and type referrencing (knowing cardContentFactory)

//    *** Full code version ***
//        private(set) var model: MemoryGame<String> =
//            MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: { (pairIndex: Int) -> String in
//                return "😂"
//            })
//    
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
