//
//  BookModel.swift
//  BookHolder
//
//  Created by Nikita on 13.04.23.
//

import Foundation
import Moya

struct SubjectModel: Decodable {
    var booksArray: [BookModel]
  
    
    enum CodingKeys: String, CodingKey {
        case booksArray = "works"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.booksArray = try container.decode([BookModel].self, forKey: .booksArray)
    }
    
}

struct BookModel: Decodable {
    var title: String
    var id: Int
    var datePublish: Int
    var key: String
    var authors: [AuthorModel]
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case id = "cover_id"
        case datePublish = "first_publish_year"
        case key = "key"
        case authors
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.id = try container.decode(Int.self, forKey: .id)
        self.datePublish = try container.decode(Int.self, forKey: .datePublish)
        self.key = try container.decode(String.self, forKey: .key)
        self.authors = try container.decode([AuthorModel].self, forKey: .authors)
    }
}

struct AuthorModel: Decodable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
    }
}
