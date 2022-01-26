//
//  BooksCarruselCollectionViewCell.swift
//  BookStore
//
//  Created by Mario Saldana on 25/01/22.
//

import UIKit

class BooksCarruselCollectionViewCell: UICollectionViewCell {
    var imageProduct : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "book")
        return image
    }()
    override init(frame : CGRect){
        super.init(frame: .zero)
        //imageProduct.backgroundColor = .white
        self.addSubview(imageProduct)
    }
    func setDataBook(libro : Libro){
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
