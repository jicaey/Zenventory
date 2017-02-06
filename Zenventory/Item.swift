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
    var description: String { get }
    var category: Category { get }
    
    init()
}

struct Wardrobe {
    var name: String
    var description: String
    var category: Category
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
        self.category = Category.wardrobe
    }
}

struct EverydayCarry {
    var name: String
    var description: String
    var category: Category
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
        self.category = Category.everydayCarry
    }
}

struct Core {
    var name: String
    var description: String
    var category: Category
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
        self.category = Category.core
    }
}

struct Consumables {
    var name: String
    var description: String
    var category: Category
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
        self.category = Category.consumables
    }
}

enum Category {
    case wardrobe
    case everydayCarry
    case core
    case consumables
}

