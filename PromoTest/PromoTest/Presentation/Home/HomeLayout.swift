//
//  HomeLayout.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import UIKit

extension HomeViewController {
    
    func setUpUI() {
        title = "Series JorFlix"
        view.backgroundColor = .black
        setUpFlowLayoutProperties()
        setUpCollectionViewProperties()
        setUpSubviews()
        setupConstraints()
    }
    
    func setUpNavigation() {
        navigationController?.navigationBar.backgroundColor = UIColor.black
    }
    
    func setUpSubviews () {
        view.addSubviewWithAutolayout(collectionView)
    }
    
    func setupConstraints() {
        collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
    func setUpFlowLayoutProperties() {
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 200, height: 320)
        layout.scrollDirection = .vertical
    }
        
    func setUpCollectionViewProperties() {
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(SeriesCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(SeriesCollectionViewCell.self))
        collectionView.allowsMultipleSelection = false
        collectionView.allowsSelection = true
    }
}
