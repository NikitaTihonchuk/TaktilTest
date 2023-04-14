//
//  RatingModel.swift
//  BookHolder
//
//  Created by Nikita on 14.04.23.
//

import Foundation

struct DocsModel: Decodable {
    var docs: [RatingModel]
    
    enum CodingKeys: String, CodingKey {
        case docs
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.docs = try container.decode([RatingModel].self, forKey: .docs)
    }
}

struct RatingModel: Decodable {
    var rating: Double
    
    enum CodingKeys: String, CodingKey {
          case rating = "ratings_average"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.rating = try container.decode(Double.self, forKey: .rating)
    }
}
