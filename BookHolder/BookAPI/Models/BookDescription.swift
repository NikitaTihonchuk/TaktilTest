//
//  BookDescription.swift
//  BookHolder
//
//  Created by Nikita on 14.04.23.
//

import Foundation

struct BookDescription: Decodable {
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case description
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decode(String.self, forKey: .description)
    }
}
