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
        image.backgroundColor = .clear
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
        label.backgroundColor = .clear
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    var nameAuthor : UILabel = {
        let authorLabel = UILabel()
        authorLabel.text = "Author"
        authorLabel.textColor = .yellow
        authorLabel.backgroundColor = .clear
        authorLabel.textColor = .gray
        authorLabel.adjustsFontSizeToFitWidth = true
        authorLabel.font = .boldSystemFont(ofSize: 15)
        return authorLabel
    }()
    var nameCategory : UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.textColor = .yellow
        categoryLabel.text = "Cathegory"
        categoryLabel.backgroundColor = .clear
        categoryLabel.textColor = .gray
        categoryLabel.font = .boldSystemFont(ofSize: 15)
        return categoryLabel
    }()
    var forwardImage : UIImageView = {
        let forwardImage = UIImageView()
        forwardImage.backgroundColor = .clear
        forwardImage.contentMode = .scaleAspectFit
        forwardImage.image = UIImage(named: "forward")
        return forwardImage
    }()
    override init(frame : CGRect){
        super.init(frame: .zero)
        self.layer.cornerRadius = 10
        //let color = UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
        self.backgroundColor = .white
        
        
        self.addSubview(imageProduct)
        imageProduct.addAnchorsAndSize(width: 120, height: 180, left: 10, top: 10, right: nil, bottom: nil)
        
        self.addSubview(nameProduct)
        nameProduct.addAnchorsAndSize(width: 180, height: 80, left: 10, top: 40, right: nil, bottom: nil, withAnchor: .left, relativeToView: imageProduct)
        
        self.addSubview(nameAuthor)
        nameAuthor.addAnchorsAndSize(width: 150, height: 40, left: 10, top: 80, right: nil, bottom: nil, withAnchor: .left, relativeToView: imageProduct)
        nameAuthor.addAnchors(left: nil, top: 15, right: nil, bottom: nil, withAnchor: .top, relativeToView: nameProduct)
        
        self.addSubview(nameCategory)
        nameCategory.addAnchorsAndSize(width: 150, height: 40, left: 10, top: nil, right: nil, bottom: nil, withAnchor: .left, relativeToView: imageProduct)
        nameCategory.addAnchors(left: nil, top: 5, right: nil, bottom: nil, withAnchor: .top, relativeToView: nameAuthor)
        
        self.addSubview(forwardImage)
        forwardImage.addAnchorsAndSize(width: 50, height: 50, left: nil, top: 100, right: 20, bottom: nil)
        
    }
    func setDataBook(libro : Libro){
        let  title = NSString(string: libro.bookTitle ?? "")
        //imageProduct.image = UIImage(named: libro.bookImage ??  "book")
        let image = NSString(string: libro.bookImage ?? "")
        print (image)
        switch image {
        case "el señor de los anillos":
            imageProduct.image = UIImage(named:"lordOf")
        case "historias mexicas":
            imageProduct.image = UIImage(named:"mexicas")
        case "el origen de las especies":
            imageProduct.image = UIImage(named:"especies")
        case "vidaEntreVidas":
            imageProduct.image = UIImage(named:"vidaEntreVidas")
        case "el filo de la navaja":
            imageProduct.image = UIImage(named:"navaja")
        case "el castillo ambulante":
            imageProduct.image = UIImage(named:"castillo")
        case "el origen de la trajedia":
            imageProduct.image = UIImage(named:"trajedia")
        default:
            imageProduct.image = UIImage(named:"book")
        }
        nameProduct.text = "\(String(describing: libro.bookTitle ?? ""))"
        nameAuthor.text = "\(String(describing: libro.author?.authorName ?? ""))"
        nameCategory.text = "\(String(describing: libro.categoria?.categoria ?? ""))"
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
