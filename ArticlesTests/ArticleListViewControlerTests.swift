//
//  ArticleListViewControolerTests.swift
//  ArticlesTests
//
//  Created by Kukreja, Chirag on 07/07/19.
//  Copyright © 2019 Kukreja, Chirag. All rights reserved.
//

import XCTest

@testable import Articles

class ArticleListViewControlerTests: XCTestCase {

    var viewControllerUnderTest: ArticleListViewController!
    override func setUp() {
        
        viewControllerUnderTest = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticleListViewController") as? ArticleListViewController
        viewControllerUnderTest.loadView()
        viewControllerUnderTest.viewDidLoad()
        
    }
    override func tearDown() {
        viewControllerUnderTest = nil
    }
    func testsViewNotNil() {
        XCTAssertNotNil(viewControllerUnderTest.view)
    }

    func testsTableViewNotNil() {
        XCTAssertNotNil(viewControllerUnderTest.tableView)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(viewControllerUnderTest.tableView.delegate)
        
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:didSelectRowAt:))))
        
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewControllerUnderTest.tableView.dataSource)
    }
    
}
