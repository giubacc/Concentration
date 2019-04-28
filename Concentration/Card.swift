//
//  Card.swift
//  Concentration
//
//  Created by Giuseppe Baccini on 16/04/2019.
//  Copyright © 2019 Giuseppe Baccini. All rights reserved.
//

import Foundation

struct Card{
    var isRevealed = false
    var id: Int
    var hasMatched = false
    
    private static var cardId = -1
    private static func generateIndex() -> Int{
        cardId += 1
        return cardId
    }
    
    init(){
        id = Card.generateIndex()
    }
}
