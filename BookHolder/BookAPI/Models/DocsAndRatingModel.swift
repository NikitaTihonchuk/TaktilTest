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
        case docs = "docs"
    }
}

struct RatingModel: Decodable {
    var rating: Double?
    
    enum CodingKeys: String, CodingKey {
          case rating = "ratings_average"
    }
    

}
