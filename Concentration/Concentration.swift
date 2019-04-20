//
//  Concentration.swift
//  Concentration
//
//  Created by Giuseppe Baccini on 16/04/2019.
//  Copyright © 2019 Giuseppe Baccini. All rights reserved.
//

import Foundation

class Concentration{
    var cards = [Card]()
    
    static var cardId = 0
    static func generateIndex() -> Int{
        cardId += 1
        return cardId
    }
    
    init(howManyCards : Int){
        for _ in 0..<howManyCards{
            cards += [Card(isRevealed: false, id: Concentration.generateIndex(), hasMatched: false)]
            cards += [cards.last!]
        }
        cards.shuffle()
    }
    
    var cardRevealedIndex: Int?
    
    func revealCard(cardIndex: Int){
        if cardRevealedIndex != nil, cardRevealedIndex! != cardIndex{
            if cards[cardRevealedIndex!].id == cards[cardIndex].id{
                cards[cardRevealedIndex!].hasMatched = true
                cards[cardIndex].hasMatched = true
            }
            cardRevealedIndex = nil
        }else{
            cards[cardIndex].isRevealed = true
            cardRevealedIndex = cardIndex
        }
    }
}
