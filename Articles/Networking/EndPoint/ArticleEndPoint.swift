//
//  EndPoint.swift
//  MyTaxi
//
//  Created by Chirag Kukreja on 06/07/19.
//  Copyright © 2019 Chirag Kukreja. All rights reserved.
//

import UIKit

enum ArticlesApi {
    case mostPopular
}

struct Constant {
    static let key = "PVPHLPaxMOmAfgTEcNlGphH8ihKVCTRW"
}
extension ArticlesApi: EndPointType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.nytimes.com/svc") else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .mostPopular:
            return "mostpopular/v2/viewed/7.json"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .mostPopular:
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["api-key": Constant.key])
            
        }
    }
    var headers: HTTPHeaders? {
        return ["Content-Type" : "application"]
    }
}
