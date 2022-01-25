//
//  BooksCollectionViewCell.swift
//  BookStore
//
//  Created by Mario Saldana on 25/01/22.
//

import UIKit

class BooksCollectionViewCell: UICollectionViewCell {
    var imageProduct : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .orange
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "forward")
        return image
    }()
    
    var nameProduct : UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .black
        label.backgroundColor = .magenta
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    var nameAuthor : UILabel = {
        let authorLabel = UILabel()
        authorLabel.textColor = .yellow
        authorLabel.text = "Author"
        authorLabel.backgroundColor = .magenta
        authorLabel.font = .boldSystemFont(ofSize: 10)
        return authorLabel
    }()
    var nameCategory : UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.textColor = .yellow
        categoryLabel.text = "Cathegory"
        categoryLabel.backgroundColor = .magenta
        categoryLabel.font = .boldSystemFont(ofSize: 10)
        return categoryLabel
    }()
    var forwardImage : UIImageView = {
        let forwardImage = UIImageView()
        forwardImage.backgroundColor = .orange
        forwardImage.contentMode = .scaleAspectFit
        forwardImage.image = UIImage(named: "forward")
        return forwardImage
    }()
    override init(frame : CGRect){
        super.init(frame: .zero)
        
        let color = UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
        self.backgroundColor = color
        
        self.addSubview(imageProduct)
        imageProduct.addAnchorsAndSize(width: 120, height: 180, left: 10, top: 10, right: nil, bottom: nil)
        
        self.addSubview(nameProduct)
        nameProduct.addAnchorsAndSize(width: 180, height: 80, left: 10, top: 40, right: nil, bottom: nil, withAnchor: .left, relativeToView: imageProduct)
//        
//        self.addSubview(nameAuthor)
//        nameProduct.addAnchorsAndSize(width: 200, height: 20, left: 10, top: 60, right: nil, bottom: nil, withAnchor: .left, relativeToView: imageProduct)
//        
//        self.addSubview(nameCategory)
//        nameProduct.addAnchorsAndSize(width: 200, height: 20, left: 10, top: 80, right: nil, bottom: nil, withAnchor: .left, relativeToView: imageProduct)
//        
//        self.addSubview(forwardImage)
//        nameProduct.addAnchorsAndSize(width: 50, height: 50, left: nil, top: 100, right: 20, bottom: nil)
        
    }
    func setDataBook(libro : Libro){
        let  title = NSString(string: libro.bookTitle ?? "")
        imageProduct.image = UIImage(named: libro.bookImage ??  "book")
        nameProduct.text = "\(String(describing: title))"
    }
    
    func setDataAuthor(autor : Author){
        nameAuthor.text = "\(autor.authorName)"
    }
    
    func setDataCategory(category : Category){
        nameCategory.text = "\(String(describing: category.categoryName))"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
