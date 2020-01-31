//
//  SeriesAPI.swift
//  PromoTest
//
//  Created by Jordi Milla on 31/01/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Moya


enum SeriesAPI {
    case getSeries
}

extension SeriesAPI:TargetType,AccessTokenAuthorizable {
    
    public var baseURL: URL {  return URL(string: "")!}
    public var path: String {
        switch self {
        case .getSeries:
            return "shows?page=1"
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
        case .getSeries:
            return .requestPlain
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
