//
//  SerieMapper.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation

public func listSerieTOMapper(value: [SerieTO]) -> [Serie] {
    
    return value.map { countK -> Serie in
        return Serie(name: countK.name ?? "", image: countK.image ?? "", rating: countK.rating ?? 0.0, sinopsis: countK.sinopsis ?? "" )
    }
}
