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
        let pen: Item = EverydayCarry(name: "Fisher Space Pen", notes: "Raw Brass")
        let shirt: Item = Wardrobe(name: "Sweater", notes: "Blue Cashmere")
        let shoes: Item = Wardrobe(name: "Winter Boots", notes: "Grey Redwings")
        let incense: Item = Consumables(name: "Nagchampa Incense", notes: "Incense Cones")
        let macbook: Item = Electronics(name: "Macbook Air", notes: "11-inch, Early 2015")
        let scissors: Item = Core(name: "Scissors", notes: "Clauss Titanium")
        
        inventory.append(contentsOf: [pen, shirt, shoes, incense, macbook, scissors])
        print(" Inventory Array: \(inventory)")
        
        
    }

}
