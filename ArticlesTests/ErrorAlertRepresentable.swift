//
//  ErrorFRepresentableTests.swift
//  ArticlesTests
//
//  Created by Kukreja, Chirag on 07/07/19.
//  Copyright © 2019 Kukreja, Chirag. All rights reserved.
//

import XCTest
@testable import Articles

class ErrorAlertRepresentableTests: XCTestCase {

    struct SUT:ErrorAlertRepresentable {
        var alertMessage: String { return "This is only a test." }
    }
    
    var sut:SUT!
    
    override func setUp() {
        super.setUp()
        sut = SUT()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    func testGenericOkayAction() {
        XCTAssertEqual(sut.genericOkayAction.title, "O.K.")
        XCTAssertEqual(sut.genericOkayAction.style, UIAlertAction.Style.default)
    }
    
    func testBasicAlertController() {
        
        let basicControllerAction = sut.basicAlertController.actions[0]
        XCTAssertEqual(basicControllerAction.title, sut.genericOkayAction.title)
        XCTAssertEqual(basicControllerAction.style, sut.genericOkayAction.style)
        
        XCTAssertNil(sut.basicAlertController.title)
        XCTAssertEqual(sut.basicAlertController.message, sut.alertMessage)
    }
}
