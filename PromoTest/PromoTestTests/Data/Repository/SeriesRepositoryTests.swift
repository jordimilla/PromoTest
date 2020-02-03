//
//  SeriesRepositoryTests.swift
//  PromoTestTests
//
//  Created by Jordi Milla on 03/02/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import XCTest
import Mockit
import RxSwift
import RxBlocking

@testable import PromoTest

class SeriesRepositoryTests: XCTestCase {

    var mockSeriesService: MockSeriesServices!
    var sut: SerieRepositoryImpl!
    
    override func setUp() {
        mockSeriesService = MockSeriesServices(testCase: self)
        sut = SerieRepositoryImpl(seriesService: mockSeriesService, listSerieTOMapper: listSerieTOMapper)
    }

    func test_get_series() throws {
        let mockSerie = SerieTO(name: "", image: "", rating: 0.0, sinopsis: "")
        let mockResponse = [mockSerie]
        
        let _ = mockSeriesService.when()
            .call(withReturnValue: mockSeriesService.getSeries(page: 0))
        .thenReturn(Single.just(mockResponse))
        
        let result = try sut.getSeries(page: 0).toBlocking().single()
        
        XCTAssertTrue(result[0].name == mockSerie.name)
        _ = self.mockSeriesService.verify(verificationMode: Once()).getSeries(page: 0)
    }

}
