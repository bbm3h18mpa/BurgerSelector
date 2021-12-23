//
//  Data.swift
//  BurgerSelector
//
//  Created by Florian Panten / BBS2H20A BBM3H18M on 21.12.21.
//

import UIKit

let burgerData = loadData()

func loadData() -> [Burger] {
    guard let file = Bundle.main.url(forResource: "data", withExtension: "json") else {
        fatalError("json error")
    }
    return try! JSONDecoder().decode([Burger].self, from: Data(contentsOf: file))
}
