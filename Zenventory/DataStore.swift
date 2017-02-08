//
//  DataStore.swift
//  Zenventory
//
//  Created by Michael Young on 2/6/17.
//  Copyright © 2017 Michael Young. All rights reserved.
//

import Foundation

class DataStore {
    static let sharedInstance = DataStore()
    private init() {}
    
    var inventory = [Item]()
    
    func generateTestData() {
        let pen = Item(name: "Sweater", notes: "Blue Cashmere", category: Category.wardrobe)
        let shirt = Item(name: "Fisher Space Pen", notes: "Raw Brass Bullet", category: Category.everydayCarry)
        let shoes = Item(name: "Grey Redwings", notes: "Winter Boots", category: Category.wardrobe)
        let incense = Item(name: "Incense Cones", notes: "Nagchampa", category: Category.consumables)
        let macbook = Item(name: "Macbook Air", notes: "11-inch, Early 2015", category: Category.electronics)
        let scissors = Item(name: "Scissors", notes: "Clauss Titanium", category: Category.core)
        let batteries = Item(name: "Vape Batteries", notes: "Six 18650s", category: Category.consumables)
        
        inventory.append(contentsOf: [pen, shirt, shoes, incense, macbook, scissors, batteries])
        print(" Inventory Array: \(inventory)")
        
    }

}
