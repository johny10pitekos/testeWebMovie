//
//  CardShopping.swift
//  WeM0vies
//
//  Created by Pitekos on 23/04/25.
//

import Foundation

class CardShopping {
    
    var card: [Product] = []
    
    static var shared: CardShopping = {
        let instance = CardShopping()
        
        return instance
    }()
}

