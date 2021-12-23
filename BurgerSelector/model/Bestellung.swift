//
//  Bestellung.swift
//  BurgerSelector
//
//  Created by Florian Panten / BBS2H20A BBM3H18M on 23.12.21.
//

import Foundation

class Bestellung {
    var burger: Burger
    var anzahl: Int
    
    init(_ burger: Burger, _ anzahl: Int) {
        self.burger = burger
        self.anzahl = anzahl
    }
}
