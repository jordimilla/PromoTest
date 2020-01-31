//
//  SeriesTableViewCell.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import UIKit

class SeriesCollectionViewCell: UICollectionViewCell {

    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    lazy var lblName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCell()
        self.backgroundColor = .red
      }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell() {
        addSubviewWithAutolayout(image)
        addSubviewWithAutolayout(lblName)
        image.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, topConstant: -40)
        image.anchor(heightConstant: 360)
        lblName.anchor(top: image.bottomAnchor, left: image.leftAnchor, bottom: bottomAnchor, right: image.rightAnchor, topConstant: -40, leftConstant: 5, rightConstant: 5)
        self.isUserInteractionEnabled = true
        self.contentView.isUserInteractionEnabled = true
    }
    
    func configureCell(serie: Serie){
        image.downloaded(from: serie.image)
        lblName.text = serie.name
    }

}
