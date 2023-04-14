//
//  ViewController.swift
//  BookHolder
//
//  Created by Nikita on 13.04.23.
//

import UIKit
import JGProgressHUD

//MARK: HomePageController
class HomePageController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
   
    private let spinner = JGProgressHUD(style: .dark)
    //array of turples that storage info and url
    private var books = [(info: BookModel, url:URL)]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Library"
        registerCell()
        tableView.dataSource = self
        tableView.delegate = self
        getRequest()
    }
   ///functions
    private func registerCell() {
        let nib = UINib(nibName: HomePageTableViewCell.id, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: HomePageTableViewCell.id)
    }
    
    private func getRequest() {
        spinner.show(in: view)
        APIProvider().getBooks(bookCategory: "drama", success: { [weak self] model in
            guard let strongSelf = self else { return }
            for book in model.booksArray {
                guard let url = URL(string: "https://covers.openlibrary.org/b/id/\(book.id)-L.jpg") else { return }
                strongSelf.books.append((book, url))
            }
        }, error: { error in
            print(error)
        })
        spinner.dismiss()
    }
    
}
//MARK: Extensions

extension HomePageController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = books[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: HomePageTableViewCell.id, for: indexPath)
        guard let bookCell = cell as? HomePageTableViewCell else { return cell }
        bookCell.set(book: book.info, url: book.url)
        
        return bookCell
    }
    
    
}

extension HomePageController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = books[indexPath.row]
        let bookVC = BookPageDescriptionViewController(nibName: BookPageDescriptionViewController.id, bundle: nil)
        bookVC.book = book
        navigationController?.pushViewController(bookVC, animated: true)
    }
}
