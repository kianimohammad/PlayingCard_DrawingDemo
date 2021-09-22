//
//  PlayingCardDeck.swift
//  Playing Card
//
//  Created by Mohammad Kiani on 2021-09-21.
//

import Foundation

struct PlayingCardDeck {
    
    private(set) var cards = [PlayingCard]()
    
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    
    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.randomBetween0AndSelf)
        }
        return nil
    }
}

//MARK: - Int extention for choosing a random number
extension Int {
    
    /// property returning a random number between 0 included and the number itselfd
    var randomBetween0AndSelf: Int {
        if self > 0 {
            return Int.random(in: 0..<self)
        } else if self < 0 {
            return -Int.random(in: 0..<abs(self))
        } else {
            return 0
        }
    }
}
