//
//  HomeViewController.swift
//  Zenventory
//
//  Created by Michael Young on 2/6/17.
//  Copyright © 2017 Michael Young. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let store = DataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        
        // Set navigationBar text color
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = Constants.Colors.grey
        titleLabel.font = UIFont.systemFont(ofSize: Constants.FontSizes.large)
        navigationItem.titleView = titleLabel
        
        collectionView?.backgroundColor = Constants.Colors.grey
        
        // Register cell identifier
        // Add Identifier to dataStore
        collectionView?.register(ItemCell.self, forCellWithReuseIdentifier: "cell")
        
        // test data
        store.generateTestData()
        
        // menuBar
        setupMenuBar()
        
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    }
    
    let menuBar: MenuBar = {
        let menuBar = MenuBar()
        return menuBar
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addContraintsWith(format: "H:|[v0]|", views: [menuBar])
        view.addContraintsWith(format: "V:|[v0(50)]", views: [menuBar])
    }
    
    
    // Mark: - UICollectionViewController
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.inventory.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemCell
        
        cell.itemNameLabel.text = "\(store.inventory[indexPath.item].name)"
        cell.descriptionTextView.text = "\(store.inventory[indexPath.row].notes)"
        cell.categoryImageView.image = store.inventory[indexPath.item].category.image
        
        
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




















