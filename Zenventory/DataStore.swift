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
}
