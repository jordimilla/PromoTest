//
//  SeriesAPI.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Moya


enum SeriesAPI {
    case getSeries(page: Int)
}

extension SeriesAPI:TargetType,AccessTokenAuthorizable {
    
    public var baseURL: URL {  return URL(string: "")!}
    public var path: String {
        switch self {
        case .getSeries:
            return "shows"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .getSeries:
            return .get
        }
    }
    
    var authorizationType: AuthorizationType {
        switch self {
        case .getSeries:
            return .bearer
        }
    }
    
    public var task: Task {
        switch self {
        case let .getSeries(page):
             return .requestParameters(parameters: ["page": page], encoding: URLEncoding.default)
        }
    }
    
    public var validationType: ValidationType {
        return .none
    }
    
    public var sampleData: Data {
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var headers: [String: String]? {
        return nil
    }
}
