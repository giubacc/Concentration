//
//  ViewController.swift
//  Concentration
//
//  Created by Giuseppe Baccini on 16/04/2019.
//  Copyright © 2019 Giuseppe Baccini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var model = Concentration(howManyCards: cardsNo)
    
    var cardsNo: Int{
        get {
            return (cardButtons.count+1)/2
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    private var emojiChoiches = ["😆", "👻", "🤑", "💣", "💎", "🔫", "🧲", "🎲", "🏀", "🍷", "🍕", "🍐", "🌞", "🐙", "🐸", "🐱"]

    var cardIdEmoji = [Int:String]()
    
    private func getEmojiForCardId(cardId: Int) -> String{
        if let emoji = cardIdEmoji[cardId]{
            return emoji
        }else if emojiChoiches.count > 0{
            cardIdEmoji[cardId] = emojiChoiches.remove(at: emojiChoiches.count.arc4random())
            return cardIdEmoji[cardId]!
        }else{
            return "?"
        }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardIndex = cardButtons.firstIndex(of: sender){
            model.chooseCard(cardIndex: cardIndex)
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = model.cards[index]
            if(card.isRevealed){
                button.setTitle(getEmojiForCardId(cardId: card.id), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor =  card.hasMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }
        }
    }
}

extension Int{
    func arc4random() -> Int{
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0{
            return Int(arc4random_uniform(UInt32(abs(self))))
        }else{
            return 0
        }
    }
}


