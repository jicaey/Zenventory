//
//  Item.swift
//  Zenventory
//
//  Created by Michael Young on 2/6/17.
//  Copyright © 2017 Michael Young. All rights reserved.
//

import Foundation
import UIKit

struct Item {
    var name: String
    var notes: String
    var category: Category
    
    init(name: String, notes: String, category: Category) {
        self.name = name
        self.notes = notes
        self.category = category
    }
}


enum Category {
    case wardrobe
    case everydayCarry
    case core
    case consumables
    case electronics
    
    // TODO: - unwrap
    var image: UIImage {
        switch self {
        case .wardrobe: return UIImage(named: "shirt")!
        case .everydayCarry: return UIImage(named: "manBag")!
        case .core: return UIImage(named: "infinite")!
        case .consumables: return UIImage(named: "candle")!
        case .electronics: return UIImage(named: "outlet")!
        }
    }
}

