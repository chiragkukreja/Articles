//
//  NetworkUrlTests.swift
//  ArticlesTests
//
//  Created by Kukreja, Chirag on 07/07/19.
//  Copyright © 2019 Kukreja, Chirag. All rights reserved.
//

import XCTest
@testable import Articles

class NetworkUrlTests: XCTestCase {

    func testURLEncoding() {
        do {
            let request = try Router<ArticlesApi>().buildRequest(from: .mostPopular)
            
            let expectedURL = "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=PVPHLPaxMOmAfgTEcNlGphH8ihKVCTRW"
            XCTAssertEqual(request.url?.absoluteString.sorted(), expectedURL.sorted())
        } catch {
            XCTFail("URL encoding failed")
        }
        
    }
}
