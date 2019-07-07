//
//  ArticleTableViewCell.swift
//  Articles
//
//  Created by Kukreja, Chirag on 06/07/19.
//  Copyright © 2019 Kukreja, Chirag. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func showArticle(_ article: Article) {
        title.text = article.title
        subTitle.text = article.byline
        publishedDate.text = article.publishedDate
    }
}
