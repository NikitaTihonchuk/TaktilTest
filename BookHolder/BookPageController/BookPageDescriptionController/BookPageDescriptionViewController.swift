//
//  BookPageDescriptionViewController.swift
//  BookHolder
//
//  Created by Nikita on 13.04.23.
//

import UIKit
import JGProgressHUD
//MARK: BookPageController(info about book)
class BookPageDescriptionViewController: UIViewController {
    static let id = String(describing: BookPageDescriptionViewController.self)
    
    @IBOutlet weak var tableView: UITableView!
    
    var book: (info: BookModel, url: URL)?
    
    private let spinner = JGProgressHUD(style: .dark)

    private var bookDescription: String = "" {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var rating: Double? {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var bookPageEnums = PageBookEnum.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.show(in: view)
        self.title = book?.info.title
        registerCell()
        getRating(model: book?.info)
        getDescription(model: book?.info)
        spinner.dismiss(animated: true)
        tableView.dataSource = self
    }
  
    ///functions
    private func registerCell() {
        let imageNib = UINib(nibName: BookImageTableViewCell.id, bundle: nil)
        tableView.register(imageNib, forCellReuseIdentifier: BookImageTableViewCell.id)
        
        let nameNib = UINib(nibName: BookNameTableViewCell.id, bundle: nil)
        tableView.register(nameNib, forCellReuseIdentifier: BookNameTableViewCell.id)
        
        let descriptionNib = UINib(nibName: BookPageDescriptionTableViewCell.id, bundle: nil)
        tableView.register(descriptionNib, forCellReuseIdentifier: BookPageDescriptionTableViewCell.id)
    }
    
    private func getDescription(model: BookModel?) {
        guard let model = model else { return }
        APIProvider().getDescription(bookKey: model.key) { [weak self] descriptionModel in
            guard let strongSelf = self else { return }
            strongSelf.bookDescription = descriptionModel.description
        } error: { error in
            print(error)
        }

    }
    
    private func getRating(model: BookModel?) {
        guard let model = model else { return }
        APIProvider().getRating(bookName: model.title) { [weak self] rating in
            guard let strongSelf = self else { return }
            strongSelf.rating = rating
        } error: { error in
            print(error)
        }
    }
    

}
//MARK: Extensions

extension BookPageDescriptionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookPageEnums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let enumType = bookPageEnums[indexPath.row]
        
        switch enumType {
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookImageTableViewCell.id, for: indexPath)
            guard let imageCell = cell as? BookImageTableViewCell,
                  let book = book else { return cell }
            imageCell.set(url: book.url)
            return imageCell
        case .nameRatingYear:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookNameTableViewCell.id, for: indexPath)
            guard let nameCell = cell as? BookNameTableViewCell,
                  let book = book else { return cell }
            nameCell.set(book: book.info, rating: rating)
            return nameCell
        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: BookPageDescriptionTableViewCell.id, for: indexPath)
            guard let descriptionCell = cell as? BookPageDescriptionTableViewCell else { return cell }
            descriptionCell.set(descriprion: bookDescription)
            return descriptionCell
        }
    }
    
  
    
    
}
