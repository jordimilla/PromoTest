//
//  HomeViewModel.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import RxSwift
import RxCocoa

class HomeViewModel: RxViewModel {
    
    private var page = 1
    private let seriesRepository: SeriesRepository
    private let schedulerHelper: SchedulerHelper
    let series = BehaviorRelay<Resource<[Serie]>?>(value: nil)
    
    init(seriesRepository: SeriesRepository, schedulerHelper: SchedulerHelper ) {
        self.seriesRepository = seriesRepository
        self.schedulerHelper = schedulerHelper
    }
    
    func getListSeries() {
        seriesRepository.getSeries(page: page)
            .subscribeOn(schedulerHelper.backgroundWorkScheduler)
            .observeOn(schedulerHelper.mainScheduler)
            .subscribe(
                onSuccess: { [weak self] (movies)  in
                    self?.series.accept(Resource.success(movies))
                    self?.page += 1
                },
                onError: { [weak self] (e:Error) in
                    self?.series.accept(Resource.failUnknown())
                }
            )
            .disposed(by: disposableBag)
    }
    
}
