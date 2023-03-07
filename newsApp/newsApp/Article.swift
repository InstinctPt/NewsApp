//
//  Article.swift
//  newsApp
//
//  Created by Acesso Leandro MP on 06/03/2023.
//

import Foundation

struct Source: Decodable {
    let id: Int?
    let name: String?
}

struct Article:Decodable {
    
    //let source: Source
    //let author: String
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    //let publishedAt: String?
    let content: String?
    
    

}

struct Response:Decodable {
    
    let status: String
    let totalResults: Int
    let articles: [Article]
}
