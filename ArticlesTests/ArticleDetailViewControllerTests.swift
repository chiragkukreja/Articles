//
//  ArticleDetailViewControllerTests.swift
//  ArticlesTests
//
//  Created by Kukreja, Chirag on 07/07/19.
//  Copyright © 2019 Kukreja, Chirag. All rights reserved.
//

import XCTest
import WebKit

@testable import Articles

class ArticleDetailViewControllerTests: XCTestCase {

    var viewControllerUnderTest: ArticleDetailViewController!
    override func setUp() {
        viewControllerUnderTest = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticleDetailViewController") as? ArticleDetailViewController
        viewControllerUnderTest.loadView()
        viewControllerUnderTest.viewDidLoad()
    }

    override func tearDown() {
        viewControllerUnderTest = nil
    }

    func testsViewNotNil() {
        XCTAssertNotNil(viewControllerUnderTest.view)
    }
    
    func testsWebViewNotNil() {
        XCTAssertNotNil(viewControllerUnderTest.webView)
    }
    
    func testWebViewHasDelegate() {
        XCTAssertNotNil(viewControllerUnderTest.webView.navigationDelegate)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: WKNavigationDelegate.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.webView(_:didStartProvisionalNavigation:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.webView(_:didFinish:))))
        
    }
}
