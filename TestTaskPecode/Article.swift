//
//  Article.swift
//  TestTaskPecode
//
//  Created by Maxim Kuba on 21.12.2020.
//

import Foundation

struct Article: Codable {
  
  var source: Sourceinfo?
  var author: String?
  var title: String?
  var description: String?
  var url: String?
  var urlToImage: String?
  var publishedAt: String?
}

struct Sourceinfo: Codable {
  var id: String?
  var name: String?
}
