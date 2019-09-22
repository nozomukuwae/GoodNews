//
//  Article.swift
//  GoodNews
//
//  Created by Nozomu Kuwae on 9/22/19.
//  Copyright © 2019 Nozomu Kuwae. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
    
    static var resource: Resource<ArticleList> {
        let filePath = Bundle.main.path(forResource: "Url", ofType: "plist")
        let plist = NSDictionary(contentsOfFile: filePath!)
        guard let urlString = plist?["Url"] as? String else { fatalError() }
        let url = URL(string: urlString)!
        return Resource<ArticleList>(url: url)
    }
}

struct Article: Decodable {
    let title: String?
    let description: String?
}
