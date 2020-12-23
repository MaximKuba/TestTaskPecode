//
//  Newsfeed.swift
//  TestTaskPecode
//
//  Created by Maxim Kuba on 21.12.2020.
//

import Foundation

struct NewsFeed: Codable {
  
  var status: String = ""
  var totalResults: Int = 0
  var articles = [Article]()
}
