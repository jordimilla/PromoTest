//
//  SeriesRepository.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import RxCocoa
import RxSwift

protocol SeriesRepository {
    func getSeries(page: Int) -> Single<[Serie]>
}

