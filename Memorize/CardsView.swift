//
//  ContentView.swift
//  Memorize
//
//  Created by Dylan Cronk on 9/18/24.
//

import SwiftUI

struct ContentView: View {
  let memorize = Memorize()
  let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
  var body: some View {
    VStack() {
      ScrollView {
        LazyVGrid(columns: columns) {
          ForEach(memorize.cards) { card in
            CardView(card: card)
              .onTapGesture{ memorize.onCardTap(card: card)}
          }
        }
      }
    }
  }
}

struct CardView: View {
  var card: Card
  var body: some View {
    ZStack {
      Text(card.value).font(.largeTitle)
      RoundedRectangle(cornerRadius: 6)
        .fill(card.isShowing ? .clear : card.color)
        .stroke(card.color, lineWidth: 3)
        .frame(width: 75, height: 100)
    }
    .rotation3DEffect(.degrees(card.isShowing ? 180 : 0), axis: (x: 0, y: 1, z: 0))
    .animation(.default, value: card.isShowing)
  }
}

#Preview {
  ContentView()
}
