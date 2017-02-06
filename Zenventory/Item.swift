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
    var category: Category
}

enum Category {
    case wardrobe
    case everydayCarry
    case core
    case consumables
}

