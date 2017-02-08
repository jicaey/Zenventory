//
//  HomeViewController.swift
//  Zenventory
//
//  Created by Michael Young on 2/6/17.
//  Copyright © 2017 Michael Young. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        collectionView?.backgroundColor = UIColor.white
        
        // Register cell identifier
        collectionView?.register(itemNameCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    // Mark: - UICollectionViewController
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    // Change Cell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calculate aspect ratio for the image
        let height = (view.frame.width - 16 - 16) * 9 / 16
        let cellSize = CGSize(width: view.frame.width, height: height + 16 + 68)
        
        return cellSize
    }
    
    // Determine spacing between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
}

// TODO: - Move to new file
// Everytime the collectionView dequeueReusableCell is call. This class init is called.
class itemNameCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been initialized")
    }
    
    let thumbnailItemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        // adds image to view from assets
        imageView.image = UIImage(named: "jaceWayland")
        
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
    
        return view
    }()
    
    let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "placeholderCategoryImage")
        // half of the width and height of the image size
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    // different contraint type to ensure proper scaling
    let itemNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Item Name"
        
        return label
    }()
    
    // different contraint type to ensure proper scaling
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Item Description • Category: Consumable • Last Date Used: 2 days ago"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.textColor = UIColor.lightGray
        
        return textView
    }()

    
    func setupViews() {
        addSubview(thumbnailItemImageView)
        addSubview(separatorView)
        addSubview(categoryImageView)
        addSubview(itemNameLabel)
        addSubview(descriptionTextView)
        
        // Auto Layout with Visual Format
        // TODO: - Readup on this contraint format
        // horizontal contraints
        addContraintsWith(format: "H:|-16-[v0]-16-|", views: [thumbnailItemImageView])
        addContraintsWith(format: "H:|[v0]|", views: [separatorView])
        addContraintsWith(format: "H:|-16-[v0(44)]", views: [categoryImageView])
        // vertical contraints
        addContraintsWith(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: [thumbnailItemImageView, categoryImageView, separatorView])
       
        // itemNameLabel contraints
        // top
        addConstraint(NSLayoutConstraint(item: itemNameLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailItemImageView, attribute: .bottom, multiplier: 1, constant: 8))
        // left
        addConstraint(NSLayoutConstraint(item: itemNameLabel, attribute: .left, relatedBy: .equal, toItem: categoryImageView, attribute: .right, multiplier: 1, constant: 8))
        // right
        addConstraint(NSLayoutConstraint(item: itemNameLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailItemImageView, attribute: .right, multiplier: 1, constant: 0))
        // height
        addConstraint(NSLayoutConstraint(item: itemNameLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        // descriptionTextView contraints
        // top
        addConstraint(NSLayoutConstraint(item: descriptionTextView, attribute: .top, relatedBy: .equal, toItem: itemNameLabel, attribute: .bottom, multiplier: 1, constant: 4))
        // left
        addConstraint(NSLayoutConstraint(item: descriptionTextView, attribute: .left, relatedBy: .equal, toItem: categoryImageView, attribute: .right, multiplier: 1, constant: 8))
        // right
        addConstraint(NSLayoutConstraint(item: descriptionTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailItemImageView, attribute: .right, multiplier: 1, constant: 0))
        // height
        addConstraint(NSLayoutConstraint(item: descriptionTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
    }
}

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




















