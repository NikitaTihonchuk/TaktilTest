//
//  BookNameTableViewCell.swift
//  BookHolder
//
//  Created by Nikita on 14.04.23.
//

import UIKit

class BookNameTableViewCell: UITableViewCell {
    static let id = String(describing: BookNameTableViewCell.self)
    
    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    func set(book: BookModel, rating: Double?) {
        bookNameLabel.text = book.title
        yearLabel.text = "," + String(book.datePublish)
        authorNameLabel.text = book.authors.first?.name
        if let rating = rating {
            ratingLabel.text = "\(rating)"
        } else {
            ratingLabel.text = "failed to parse"
        }
        
    }

    
}
