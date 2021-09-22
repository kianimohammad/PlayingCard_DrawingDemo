//
//  ViewController.swift
//  Playing Card
//
//  Created by Mohammad Kiani on 2021-09-21.
//

import UIKit

class ViewController: UIViewController {
    
    private var deck = PlayingCardDeck()

    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard(_:)))
            let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard(_:)))
//            swipe.direction = [.up, .down]
            upSwipe.direction = .up
            downSwipe.direction = .down
            playingCardView.addGestureRecognizer(upSwipe)
            playingCardView.addGestureRecognizer(downSwipe)
        }
    }
    
    @objc func nextCard(_ sender: UISwipeGestureRecognizer) {
        // randomly take a card from the deck and show on view
        if sender.state == .ended {
            let direction = sender.direction
            if let card = deck.draw() {
                UIView.transition(with: playingCardView, duration: 0.5, options: [.curveEaseInOut, direction == .up ? .transitionCurlUp : .transitionCurlDown]) {
                    self.playingCardView.rank = card.rank.order
                    self.playingCardView.suit = card.suit.rawValue
                }
            }
        }
    }

    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            UIView.transition(with: playingCardView, duration: 0.5, options: .transitionFlipFromLeft) {
                self.playingCardView.isFaceUp = !self.playingCardView.isFaceUp
            }
        }
    }
    
}

