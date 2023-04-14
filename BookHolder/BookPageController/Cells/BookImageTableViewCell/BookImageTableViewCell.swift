//
//  BookImageTableViewCell.swift
//  BookHolder
//
//  Created by Nikita on 14.04.23.
//

import UIKit
import SDWebImage

class BookImageTableViewCell: UITableViewCell {
    static let id = String(describing: BookImageTableViewCell.self)
    

    @IBOutlet weak var bookImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
///loads a photo without stopping the main queue
    func set(url: URL) {
        bookImage.sd_setImage(with: url)
    }

    
}
