//
//  Card.swift
//  Memorize
//
//  Created by Dylan Cronk on 9/18/24.
//

import Foundation
import SwiftUI

@Observable
class Card: Identifiable {
  var isShowing = false
  var value = ""
  var color: Color = .clear
}
