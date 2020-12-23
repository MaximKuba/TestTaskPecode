//
//  ApiCall.swift
//  TestTaskPecode
//
//  Created by Maxim Kuba on 21.12.2020.
//

import Foundation

class ApiCall {
  
  private init(){}
  static let shared = ApiCall()
  
 // hardcoded url
  private let urlString = "https://newsapi.org/v2/everything?q=apple&from=2020-12-21&sortBy=publishedAt&apiKey=62f0f90bc01f4598b0eabd9d00a9d65f"
  
  func fetchData( completionHandler: @escaping (NewsFeed) -> () ){
    let url = URL(string: urlString)

    guard url != nil else {
      return
    }
    let session = URLSession.shared
    let dataTask = session.dataTask(with: url!) { (data, response, error) in
      
      if error == nil && data != nil {
        
        let decoder = JSONDecoder()
        do {
          let newsFeed = try decoder.decode(NewsFeed.self, from: data!)
          print(newsFeed.articles.count)
          completionHandler(newsFeed)
        }
        catch {
          print("Too many requests for today ")
        }
        
      }
      
    }
    //Api call
    dataTask.resume()
    
  }
  
  
  
  
}
