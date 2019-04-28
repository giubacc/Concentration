//
//  Concentration.swift
//  Concentration
//
//  Created by Giuseppe Baccini on 16/04/2019.
//  Copyright © 2019 Giuseppe Baccini. All rights reserved.
//

import Foundation

class Concentration{
    private(set) var cards = [Card]()
    
    init(howManyCards : Int){
        for _ in 0..<howManyCards{
            cards += [Card()]
            cards += [cards.last!]
        }
        cards.shuffle()
    }
    
    private var cardRevealedIndex: Int?{
        get{
            var revealedIndex : Int?
            for index in cards.indices{
                if cards[index].isRevealed{
                    if(revealedIndex == nil){
                        revealedIndex = index
                    }else{
                        return nil
                    }
                }
            }
            return revealedIndex
        }
        set{
            for index in cards.indices{
                cards[index].isRevealed = index == newValue
            }
        }
    }
    
    func chooseCard(cardIndex: Int){
        if cards[cardIndex].hasMatched {
            return
        }
        if cardRevealedIndex != nil, cardRevealedIndex! != cardIndex{
            if cards[cardRevealedIndex!].id == cards[cardIndex].id{
                cards[cardRevealedIndex!].hasMatched = true
                cards[cardIndex].hasMatched = true
            }
            cards[cardIndex].isRevealed = true
        }else{
            cardRevealedIndex = cardIndex
        }
    }
}
