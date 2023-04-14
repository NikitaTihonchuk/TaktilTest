//
//  API.swift
//  BookHolder
//
//  Created by Nikita on 13.04.23.
//

import Foundation
import Moya

enum BookAPI {
    case getBooks(category: String)
    case getImageForEachBook(id: Int)
    case getDescription(key: String)
    case getRating(bookName: String)
}

extension BookAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .getBooks, .getImageForEachBook, .getDescription, .getRating:
            return URL(string: "https://openlibrary.org")!
        }
    }
    var path: String {
        switch self {
        case .getBooks(let category):
            return "/subjects/\(category).json"
        case .getImageForEachBook(let id):
            return "/b/id/\(id)-S.jpg"
        case .getDescription(let key):
            return "/\(key).json"
        case .getRating:
            return "/search.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getBooks, .getImageForEachBook, .getDescription, .getRating:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Moya.Task {
        guard let parameters else { return .requestPlain }
        
        return .requestParameters(parameters: parameters, encoding: encoding)
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameters: [String: Any]? {
        var parameters = [String : Any]()
        
        switch self {
        case .getBooks, .getImageForEachBook, .getDescription:
            return nil
        case .getRating(bookName: let bookName):
            parameters["q"] = bookName.replacingOccurrences(of: " ", with: "+")
        }
        
        return parameters
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .getBooks, .getImageForEachBook, .getDescription:
            return URLEncoding.httpBody
        case .getRating:
            return URLEncoding.queryString
        }
    }
    
    
}
