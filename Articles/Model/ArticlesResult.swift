//
//  ArticlesResult.swift
//  Articles
//
//  Created by Kukreja, Chirag on 06/07/19.
//  Copyright © 2019 Kukreja, Chirag. All rights reserved.
//

import UIKit

/**
 * Model data representing a article
 */

struct ArticlesResult: Codable {
    var results: [Article]
}

struct Article: Codable {
    let url: String
    let title: String
    let byline: String
    let publishedDate: String
}
