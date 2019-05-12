//
//  Card.swift
//  Concentration
//
//  Created by Giuseppe Baccini on 16/04/2019.
//  Copyright © 2019 Giuseppe Baccini. All rights reserved.
//

import Foundation

struct Card : Hashable{
    var isRevealed = false
    private var id: Int
    var hasMatched = false
    
    static func ==(lhs: Card, rhs: Card) -> Bool{
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    private static var cardId = -1
    private static func generateIndex() -> Int{
        cardId += 1
        return cardId
    }
    
    init(){
        id = Card.generateIndex()
    }
}
