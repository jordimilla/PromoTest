//
//  SerieTO.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import ObjectMapper

public struct SerieTO {
    var name: String?
    var image: String?
    var rating: Float?
    var sinopsis: String?
}

extension SerieTO: Mappable{
    public init?(map: Map) {
    }
    
   public  mutating func mapping(map: Map) {
        name <- map["name"]
        image <- map["image.medium"]
        rating <- map["rating.average"]
        sinopsis <- map["summary"]

    }
}


