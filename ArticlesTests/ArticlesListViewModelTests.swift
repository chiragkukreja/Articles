//
//  ArticleViewModelTests.swift
//  ArticlesTests
//
//  Created by Kukreja, Chirag on 07/07/19.
//  Copyright © 2019 Kukreja, Chirag. All rights reserved.
//

import XCTest

@testable import Articles

class ArticlesListViewModelTests: XCTestCase {

    private let viewModel = ArticlesListViewModel()
    private var articleListExpectation: XCTestExpectation!

    
    override func setUp() {
        super.setUp()
        viewModel.delegate = self
    }
    
    func testsArticleList() {
        articleListExpectation = expectation(description: "Article List")
        viewModel.fetchArticles()
        wait(for: [articleListExpectation], timeout: 30)
        XCTAssertTrue(viewModel.numberOfArticles() > 0)
    }
}
extension ArticlesListViewModelTests: ArticlesListViewModelDelegate {
    func onFetchError() {
        articleListExpectation.fulfill()
    }
    
    func onFetchCompleted() {
        articleListExpectation.fulfill()
    }
    
}
