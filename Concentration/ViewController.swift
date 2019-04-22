//
//  ViewController.swift
//  Concentration
//
//  Created by Giuseppe Baccini on 16/04/2019.
//  Copyright © 2019 Giuseppe Baccini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var model = Concentration(howManyCards: (cardButtons.count+1)/2)
    
    @IBOutlet var cardButtons: [UIButton]!
    var emojiChoiches = ["😆", "👻", "🤑", "💣", "💎", "🔫", "🧲", "🎲", "🏀", "🍷", "🍕", "🍐", "🌞", "🐙", "🐸", "🐱"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardIndex = cardButtons.firstIndex(of: sender){
            model.chooseCard(cardIndex: cardIndex)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = model.cards[index]
            if(card.isRevealed){
                button.setTitle(emojiChoiches[card.id], for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor =  card.hasMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }
        }
    }
}

