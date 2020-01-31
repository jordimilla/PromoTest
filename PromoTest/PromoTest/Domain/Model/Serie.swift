//
//  Serie.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation

public struct Serie {
    public let name: String
    public let image: String
    public let rating: Float
    public let sinopsis: String
    
    public init(name: String, image: String, rating: Float, sinopsis: String) {
        self.name = name
        self.image = image
        self.rating = rating
        self.sinopsis = sinopsis
    }
}
