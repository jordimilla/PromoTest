//
//  DetailViewController+Layout.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import UIKit

extension DetailViewController {
    
    func setUpUI() {
        setUpSubviews()
        setUpConstraints()
        setUpScrollViewProperties()
        setUpContainerViewProperties()
        setUpTextFieldsProperties()
    }
    
    func setUpSubviews() {
        view.addSubviewWithAutolayout(scrollView)
        scrollView.addSubviewWithAutolayout(containerView)
        containerView.addSubviewWithAutolayout(imageView)
        containerView.addSubviewWithAutolayout(nameLabel)
        containerView.addSubviewWithAutolayout(ratingLabel)
        containerView.addSubviewWithAutolayout(sinopsisLabel)
    }
    
    func setUpConstraints () {
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, leftConstant: 0)
        containerView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: view.rightAnchor, leftConstant: 0)
        imageView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor, topConstant: 64)
        nameLabel.anchor(top: imageView.bottomAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor, topConstant: 24, leftConstant: 16, rightConstant: 26)
        ratingLabel.anchor(top: nameLabel.bottomAnchor, left: containerView.leftAnchor, right: containerView.rightAnchor, topConstant: 24, leftConstant: 16, rightConstant: 26)
        sinopsisLabel.anchor(top: ratingLabel.bottomAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, topConstant: 24, leftConstant: 16, bottomConstant: 20, rightConstant: 26)
    }
    
    func setUpScrollViewProperties() {
        scrollView.backgroundColor = .black
    }
    
    func setUpContainerViewProperties() {
        containerView.backgroundColor = .black
    }
    
    func setUpTextFieldsProperties() {
        nameLabel.textColor = .white
        ratingLabel.textColor = .white
        sinopsisLabel.textColor = .white
        sinopsisLabel.numberOfLines = 0
        sinopsisLabel.lineBreakMode = .byWordWrapping
    }
    
}
