//
//  ArticlesListViewModel.swift
//  Articles
//
//  Created by Kukreja, Chirag on 06/07/19.
//  Copyright © 2019 Kukreja, Chirag. All rights reserved.
//

import UIKit

protocol ArticlesListViewModelDelegate: class {
    func onFetchCompleted()
    func onFetchError()

}
class ArticlesListViewModel: NSObject {
    
    let router = Router<ArticlesApi>()
    
    weak var delegate: ArticlesListViewModelDelegate?
     private var articles = [Article]()
    
    /**
     * This func fetches articls article from the server
     */

    func fetchArticles() {
        router.request(.mostPopular, mapToModel: ArticlesResult.self, onSuccess: { [weak self] (result) in
            self?.articles = result.results
            self?.delegate?.onFetchCompleted()
        }) { [weak self] (error) in
            self?.delegate?.onFetchError()
        }
    }
}

extension ArticlesListViewModel {
    
    func numberOfArticles() -> Int {
        return articles.count
    }
    
    func article(at index: Int) -> Article {
        return articles[index]
    }
}
