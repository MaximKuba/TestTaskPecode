//
//  NewsViewController.swift
//  TestTaskPecode
//
//  Created by Maxim Kuba on 21.12.2020.
//

import UIKit
import WebKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet var tableView: UITableView!
  var data = NewsFeed()
  var refreshControl: UIRefreshControl?
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    title = "News"
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    addRefreshControl()
    fetching()
    
  }
  func addRefreshControl() {
    refreshControl = UIRefreshControl()
    refreshControl?.addTarget(self, action: #selector(refreshList), for: .valueChanged)
    tableView.addSubview(refreshControl!)
  }
  @objc func refreshList() {
    refreshControl?.endRefreshing()
    fetching()
  }
  
  func fetching() {
    ApiCall.shared.fetchData { (NewsFeed) in
      DispatchQueue.main.async {
        self.data = NewsFeed
        self.tableView.reloadData()
      }
    }
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.articles.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomTableViewCell else { return UITableViewCell()}
    
    cell.author.text = data.articles[indexPath.row].author ?? "Unknown"
    cell.source.text = data.articles[indexPath.row].source?.name ?? "Unknown"
    cell.title.text = data.articles[indexPath.row].title ?? "Unknown"
    cell.decription.text = data.articles[indexPath.row].description ?? "Unknown"
    if let urlString = data.articles[indexPath.row].urlToImage, !urlString.isEmpty, let url = URL(string: urlString) {
      cell.imageNews.loadFromUrl(url: url)
    }
    else {
        cell.imageNews.image = UIImage(named: "noPhoto.jpg")
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //return tableView.frame.height / 3
    return 250
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let urlToNews = data.articles[indexPath.row].url {
      let vc =  storyboard?.instantiateViewController(identifier: "WebViewController") as? WebViewController
      vc?.testlink = urlToNews
      self.navigationController?.pushViewController(vc!, animated: true)
      
    }
    
    
  }
  
}
extension UIImageView {
  func loadFromUrl(url: URL) {
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url) {
        if let image  = UIImage(data: data) {
          DispatchQueue.main.async {
            self?.image = image
          }
        }
      }
      
    }
  }
  
}
