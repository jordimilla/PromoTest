//
//  SerieRepositoryImpl.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import RxCocoa
import RxSwift

class SerieRepositoryImpl: SeriesRepository {

    private let seriesService: SeriesServices
    private let listSerieTOMapper: ([SerieTO]) -> [Serie]
    
    init(seriesService: SeriesServices,
         listSerieTOMapper: @escaping ([SerieTO]) -> [Serie]) {
        self.seriesService = seriesService
        self.listSerieTOMapper = listSerieTOMapper
    }
    
    public func getSeries(page: Int) -> Single<[Serie]> {
        return seriesService.getSeries(page: page)
            .map{ responseTO in
                self.listSerieTOMapper(responseTO)
        }
    }

    
}
