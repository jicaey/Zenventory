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
        navigationController?.navigationBar.isTranslucent = false
        
        // Set navigationBar text color
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = Constants.Colors.cream
        titleLabel.font = UIFont.systemFont(ofSize: Constants.FontSizes.large)
        navigationItem.titleView = titleLabel
            
        collectionView?.backgroundColor = UIColor.white
        
        // Register cell identifier
        collectionView?.register(ItemCell.self, forCellWithReuseIdentifier: "cell")
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




















