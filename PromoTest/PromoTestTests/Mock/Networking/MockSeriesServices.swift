//
//  MockSeriesServices.swift
//  PromoTestTests
//
//  Created by Jordi Milla on 03/02/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation
import Mockit
import XCTest
import RxSwift

@testable import PromoTest

class MockSeriesServices: NSObject, Mock {
    let callHandler: CallHandler
    
    init(testCase: XCTestCase) {
        callHandler = CallHandlerImpl(withTestCase: testCase)
    }
    
    func instanceType() -> MockSeriesServices {
        return self
    }
}

extension MockSeriesServices: SeriesServices {
    
    func getSeries(page: Int) -> Single<[SerieTO]> {
        let mockResponse = Array<SerieTO>()
        return callHandler.accept(Single.just(mockResponse), ofFunction: #function, atFile: #file, inLine: #line, withArgs: nil) as! Single<[SerieTO]>
    }
    
}
