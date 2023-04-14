//
//  BookPageDescriptionTableViewCell.swift
//  BookHolder
//
//  Created by Nikita on 14.04.23.
//

import UIKit

class BookPageDescriptionTableViewCell: UITableViewCell {
    static let id = String(describing: BookPageDescriptionTableViewCell.self)

    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(descriprion: String) {
        descriptionLabel.text = descriprion
        //Built my cell depending on text size
        let labelSize = descriptionLabel.sizeThatFits(CGSize(width: descriptionLabel.frame.width, height: CGFloat.greatestFiniteMagnitude))
        descriptionLabel.frame.size.height = labelSize.height
            frame.size.height = labelSize.height
    }

    
}
