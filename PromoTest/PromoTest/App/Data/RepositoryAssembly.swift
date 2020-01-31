//
//  RepositoryAssembly.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Swinject

class RepositoryAssembly: Assembly{
    
    func assemble(container: Container) {
        container.register(SeriesRepository.self) {  r in
           SerieRepositoryImpl(
                seriesService: r.resolve(SeriesServices.self)!,
                listSerieTOMapper: listSerieTOMapper)
            }.inObjectScope(.weak)
    }
}
