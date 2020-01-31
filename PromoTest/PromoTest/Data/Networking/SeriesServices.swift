//
//  SeriesServices.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import NetworkExtension
import Moya_ObjectMapper

protocol SeriesServices {
    func getSeries(page: Int) -> Single<[SerieTO]>
}

class SeriesServicesImpl: SeriesServices {
    
    private let provider:MoyaProvider<SeriesAPI>
    
    init(provider: MoyaProvider<SeriesAPI>) {
        self.provider = provider
    }
        
    func getSeries(page: Int) -> Single<[SerieTO]> {
        return provider.rx.request(.getSeries(page: page))
            .mapArray(SerieTO.self)
    }
}
