//
//  MenuBar.swift
//  Zenventory
//
//  Created by Michael Young on 2/8/17.
//  Copyright © 2017 Michael Young. All rights reserved.
//

import UIKit

class MenuBar: UIView {
    // Rename and add to contants
    let cellId = "cellId"
    
    let menuBarImages = ["home", "book", "people", "chat"]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = Constants.Colors.darkBlue
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(MenuBarCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addContraintsWith(format: "H:|[v0]|", views: [collectionView])
        addContraintsWith(format: "V:|[v0]|", views: [collectionView])
        
        backgroundColor = Constants.Colors.darkBlue
        
        // make home menuBar image selected upon loading
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: [])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuBar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuBarCell
        // TODO: - read up on rendering mode. 
        // enabled tint color tweak
        cell.imageView.image = UIImage(named: "\(menuBarImages[indexPath.item])")?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = Constants.Colors.green
        return cell
    }
}

extension MenuBar: UICollectionViewDelegate {}

extension MenuBar: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = CGSize(width: frame.width / 4, height: frame.height)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

class MenuBarCell: BaseCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Constants.Colors.green
        return imageView
    }()
    
    override var isHighlighted: Bool {
        didSet {
            // TODO: - Look up Ternary Operators
            imageView.tintColor = isHighlighted ? Constants.Colors.grey : Constants.Colors.green
        }
    }
    
    override var isSelected: Bool {
        didSet {
            // TODO: - Look up Ternary Operators
            imageView.tintColor = isSelected ? Constants.Colors.grey : Constants.Colors.green
        }
    }

    
   
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        
        addContraintsWith(format: "H:[v0(28)]", views: [imageView])
        addContraintsWith(format: "V:[v0(28)]", views: [imageView])
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}


