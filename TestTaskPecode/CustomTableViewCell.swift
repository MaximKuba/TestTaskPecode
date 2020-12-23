//
//  CustomTableViewCell.swift
//  TestTaskPecode
//
//  Created by Maxim Kuba on 21.12.2020.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
  
  
  @IBOutlet weak var imageNews: UIImageView!
  
  @IBOutlet var source: UILabel!
  
  @IBOutlet var author: UILabel!
  
  @IBOutlet var decription: UILabel!
  @IBOutlet var title: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
  
}
