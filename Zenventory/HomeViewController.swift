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
    
    func setupViews() {
        addSubview(thumbnailItemImageView)
        addSubview(separatorView)

        backgroundColor = UIColor.lightGray
        
        // Auto Layout with Visual Format
        // TODO: - Readup on this contraint format
        addContraintsWith(format: "H:|-16-[v0]-16-|", views: [thumbnailItemImageView])
        addContraintsWith(format: "V:|-16-[v0]-16-[v1(1)]|", views: [thumbnailItemImageView, separatorView])
        
        addContraintsWith(format: "H:|[v0]|", views: [separatorView])
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




















