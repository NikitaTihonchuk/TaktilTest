//
//  BookTableViewCell.swift
//  BookHolder
//
//  Created by Nikita on 13.04.23.
//

import UIKit
import SDWebImage
//MARK: Cell for my main page
class HomePageTableViewCell: UITableViewCell {
    static let id = String(describing: HomePageTableViewCell.self)
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var datePublishingLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    //func that recieve data from mainPage
    func set(book: BookModel, url: URL) {
        titleLabel.text = book.title
        datePublishingLabel.text = String(book.datePublish)
        bookImage.sd_setImage(with: url)
    }

    
}
