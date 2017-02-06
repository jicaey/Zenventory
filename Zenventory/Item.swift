//
//  Item.swift
//  Zenventory
//
//  Created by Michael Young on 2/6/17.
//  Copyright © 2017 Michael Young. All rights reserved.
//

import Foundation

protocol Item {
    var name: String { get }
    var notes: String { get }
    var category: Category { get }
}

struct Wardrobe: Item {
    var name: String
    var notes: String
    var category: Category
    
    init(name: String, notes: String) {
        self.name = name
        self.notes = notes
        self.category = Category.wardrobe
    }
}

struct EverydayCarry: Item {
    var name: String
    var notes: String
    var category: Category
    
    init(name: String, notes: String) {
        self.name = name
        self.notes = notes
        self.category = Category.everydayCarry
    }
}

struct Core: Item {
    var name: String
    var notes: String
    var category: Category
    
    init(name: String, notes: String) {
        self.name = name
        self.notes = notes
        self.category = Category.core
    }
}

struct Consumables: Item {
    var name: String
    var notes: String
    var category: Category
    
    init(name: String, notes: String) {
        self.name = name
        self.notes = notes
        self.category = Category.consumables
    }
}

struct Electronics: Item {
    var name: String
    var notes: String
    var category: Category
    
    init(name: String, notes: String) {
        self.name = name
        self.notes = notes
        self.category = Category.electronics
    }
}

enum Category {
    case wardrobe
    case everydayCarry
    case core
    case consumables
    case electronics
}

