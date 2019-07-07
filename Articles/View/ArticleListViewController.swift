//
//  ViewController.swift
//  Articles
//
//  Created by Kukreja, Chirag on 06/07/19.
//  Copyright © 2019 Kukreja, Chirag. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController, ErrorAlertRepresentable {
    
    
    var viewModel = ArticlesListViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var alertMessage: String {
        return "Unable to get articles"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Articles"
        tableView.isHidden = true
        viewModel.delegate = self
        viewModel.fetchArticles()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight =  UITableView.automaticDimension
        spinner.startAnimating()
    }
    
}

/**
 * TableView datasource and delegate
 */

extension ArticleListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfArticles()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArticleTableViewCell
        cell.showArticle(viewModel.article(at: indexPath.row))
        return  cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticleDetailViewController") as! ArticleDetailViewController
        vc.urlString = viewModel.article(at: indexPath.row).url
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ArticleListViewController: ArticlesListViewModelDelegate {
    func onFetchError() {
        spinner.stopAnimating()
        present(basicAlertController, animated: true)
    }
    
    func onFetchCompleted() {
        spinner.stopAnimating()
        tableView.isHidden = false
        tableView.reloadData()
    }
}

