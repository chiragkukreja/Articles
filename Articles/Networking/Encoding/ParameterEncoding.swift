//
//  ParameterEncoding.swift
//  MyTaxi
//
//  Created by Chirag Kukreja on 06/07/19.
//  Copyright © 2019 Chirag Kukreja. All rights reserved.
//

import Foundation

 typealias Parameters = [String:Any]

protocol ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

 enum ParameterEncoding {
    
    case urlEncoding
    
     func encode(urlRequest: inout URLRequest,
                       bodyParameters: Parameters?,
                       urlParameters: Parameters?) throws {
        do {
            switch self {
            case .urlEncoding:
                guard let urlParameters = urlParameters else { return }
                try URLParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
            }
        }catch {
            throw error
        }
    }
}


 enum NetworkError : String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL is nil."
}
