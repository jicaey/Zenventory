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
        let cellSize = CGSize(width: view.frame.width, height: 200)
        
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
    
    // TODO: - Readup on closures
    let thumbnailItemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        
        return imageView
    }()
    
    // TODO: - Readup on closures
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
    
        return view
    }()
    
    // TODO: - Readup on closures
    let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.green
        
        return imageView
    }()
    
    // TODO: - Readup on closures
    // different contraint type to ensure proper scaling
    let itemNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // TODO: - Readup on closures
    // different contraint type to ensure proper scaling
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.yellow
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()

    
    func setupViews() {
        addSubview(thumbnailItemImageView)
        addSubview(separatorView)
        addSubview(categoryImageView)
        addSubview(itemNameLabel)
        addSubview(descriptionTextView)
        
        backgroundColor = UIColor.lightGray
        
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
        addConstraint(NSLayoutConstraint(item: descriptionTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
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




















