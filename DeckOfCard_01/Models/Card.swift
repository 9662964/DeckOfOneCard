//
//  Card.swift
//  DeckOfCard_01
//
//  Created by iljoo Chae on 6/16/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation

struct TopLevelObject: Decodable {
    var cards: [Card]
}

struct Card: Decodable {
    let value: String
    let suit: String
    let image: URL
}

