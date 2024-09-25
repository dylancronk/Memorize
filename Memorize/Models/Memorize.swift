//
//  Cards.swift
//  Memorize
//
//  Created by Dylan Cronk on 9/18/24.
//

import Foundation
import SwiftUI

@Observable
class Memorize {
  let themes: Set<Theme> = [Theme(name: "Bugs", emojis: ["🐞","🐛","🐜","🦟", "🪲", "🪳", "🕷️"], color: .green), Theme(name: "Vegetables", emojis: ["🌶️","🥕","🥬","🥦","🥒","🍆","🌽","🥔","🍠","🧄","🧅","🫛","🍅","🫑","🥗"], color: .red),
                            Theme(name: "Reptiles", emojis: ["🐍","🐢","🦖","🦎","🦕","🐊","🐲","🐉"], color: .gray)]
  var cards: [Card] = []
  var prevCard: Card? = nil  
  
  init() {
    let theme = themes.randomElement()
    for emoji in theme?.emojis ?? [] {
      var card = Card()
      card.value = emoji
      card.color = theme?.color ?? .clear
      cards.append(card)
      card = Card()
      card.value = emoji
      card.color = theme?.color ?? .clear
      cards.append(card)
    }
    cards.shuffle()
  }
  
  func onCardTap(card: Card) {
    
    guard !card.isShowing else { return }
    
    card.isShowing = true
    
    if prevCard == nil {
      prevCard = card
    } else if prevCard?.value != card.value {
      DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
        card.isShowing = false
        self.prevCard?.isShowing = false
        self.prevCard = nil
      }
    } else {
      prevCard = nil
    }
  }
}

struct Theme: Hashable {
  let name: String
  let emojis: [String]
  let color: Color
}

