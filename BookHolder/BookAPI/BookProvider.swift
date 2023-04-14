//
//  BookProvider.swift
//  BookHolder
//
//  Created by Nikita on 13.04.23.
//

import Foundation
import Moya

typealias ArrayResponce<T: Decodable> = (([T]) -> Void)
typealias ObjectResponce<T: Decodable> = ((T) -> Void)
typealias Error = ((String) -> Void)

final class APIProvider {
    private let provider = MoyaProvider<BookAPI>(plugins: [NetworkLoggerPlugin()])
    
    func getBooks(bookCategory: String, success: @escaping ObjectResponce<SubjectModel>, error: @escaping Error) {
        provider.request(.getBooks(category: bookCategory)) { result in
            switch result {
            case .success(let responce):
                guard let book = try? JSONDecoder().decode(SubjectModel.self, from: responce.data) else { return }
                success(book)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getDescription(bookKey: String, success: @escaping ObjectResponce<BookDescription>, error: @escaping Error) {
        provider.request(.getDescription(key: bookKey)) { result in
            switch result {
            case .success(let responce):
                guard let description = try? JSONDecoder().decode(BookDescription.self, from: responce.data) else { return }
                success(description)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getRating(bookName: String, success: @escaping (Double?) -> Void, error: @escaping Error) {
        provider.request(.getRating(bookName: bookName)) { result in
            switch result {
            case .success(let responce):
                do {
                    let model = try JSONDecoder().decode(DocsModel.self, from: responce.data)
                    let rating = model.docs.first?.rating
                    print("Rating for The Lord of the Rings: \(rating)")
                    success(rating)
                } catch {
                    print("Error decoding response: \(error)")
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}
