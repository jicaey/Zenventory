//
//  MenuBar.swift
//  Zenventory
//
//  Created by Michael Young on 2/8/17.
//  Copyright © 2017 Michael Young. All rights reserved.
//

import UIKit

class MenuBar: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Constants.Colors.midBlue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
