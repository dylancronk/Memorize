//
//  Cards.swift
//  Memorize
//
//  Created by Dylan Cronk on 9/18/24.
//

import Foundation
import SwiftUI

class Memorize {
  let themes: Set<Theme> = [Theme(name: "Bugs", emojis: ["🐞","🐛","🐜","🦟", "🪲", "🪳", "🕷️"], color: .green), ]
  let bugs = ["🐞","🐛","🐜","🦟", "🪲", "🪳", "🕷️"]
  let vegetables = ["🌶️","🥕","🥬","🥦","🥒","🍆","🌽","🥔","🍠","🧄","🧅","🫛","🍅","🫑","🥗"]
  let reptiles = ["🐍","🐢","🦖","🦎","🦕","🐊","🐲","🐉"]
  var cards: [Card] = []
  init() {
    for bug in vegetables {
      let card1 = Card()
      let card2 = Card()
      card1.isShowing = false
      card1.value = bug
      card2.isShowing = false
      card2.value = bug
      cards.append(card1)
      cards.append(card2)
    }
    cards.shuffle()
  }
}

struct Theme: Hashable {
  let name: String
  let emojis: [String]
  let color: Color
}

