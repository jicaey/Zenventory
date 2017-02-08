//
//  Extentions.swift
//  Zenventory
//
//  Created by Michael Young on 2/7/17.
//  Copyright © 2017 Michael Young. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addContraintsWith(format: String, views: [UIView]) {
        var viewsDictionary = [String : UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
