////
////  BooksCarruselCollectionViewCell.swift
////  BookStore
////
////  Created by Mario Saldana on 25/01/22.
////
//
//import UIKit
//
//class BooksCarruselCollectionViewCell: UICollectionViewCell {
//    var imageProduct : UIImageView = {
//        let image = UIImageView()
//        image.backgroundColor = .clear
////        image.contentMode = .scaleAspectFit
//        image.image = UIImage(named: "book")
//        return image
//    }()
//    var booksCarruselView : UICollectionView = { // Ponemos el nombre de la var, su tipo y lo igualamaos a {}()
//
//        let layout = UICollectionViewFlowLayout() // Declaramo un layout el cual nos servirá para definir los atributtos del collectionView
//       // layout.scrollDirection = .horizontal// Aqui definimos el tipo de scroll que tendrá el collection
//
//        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 20
//        layout.minimumInteritemSpacing = 20
//
//        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collection.register(BooksCarruselCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//        collection.isPagingEnabled = true
//        collection.translatesAutoresizingMaskIntoConstraints = false
//        collection.backgroundColor = .red
//        collection.layer.cornerRadius = 10
//        collection.showsVerticalScrollIndicator = true
//        collection.showsHorizontalScrollIndicator = true
//        return collection // Debemos retornar un valor del tipo del cual estamos declarando
//    }()
//
//    override init(frame : CGRect){
//        super.init(frame: .zero)
//        //imageProduct.backgroundColor = .white
//        self.addSubview(imageProduct)
//
//
//        booksCarruselView.delegate = self
//        booksCarruselView.dataSource = self
//        booksCarruselView.backgroundColor = .red
//        self.addSubview(booksCarruselView)
////        booksCarruselView.addAnchorsAndSize(width: nil, height: 300, left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: topImageView)
//        booksCarruselView.addAnchorsAndSize(width: nil, height: 300, left: 10, top: 10, right: 10, bottom: nil)
//
//    }
//    func setDataBook(libro : Libro){//no se ha llamado la funcion, se manda llamar en las extenciones
//        let image = NSString(string: libro.bookImage ?? "")
//        print (image)
//        switch image {
//        case "el señor de los anillos":
//            imageProduct.image = UIImage(named:"lordOf")
//        case "historias mexicas":
//            imageProduct.image = UIImage(named:"mexicas")
//        case "el origen de las especies":
//            imageProduct.image = UIImage(named:"especies")
//        case "vidaEntreVidas":
//            imageProduct.image = UIImage(named:"vidaEntreVidas")
//        case "el filo de la navaja":
//            imageProduct.image = UIImage(named:"navaja")
//        case "el castillo ambulante":
//            imageProduct.image = UIImage(named:"castillo")
//        case "el origen de la trajedia":
//            imageProduct.image = UIImage(named:"trajedia")
//        default:
//            imageProduct.image = UIImage(named:"book")
//        }
//    }
//
//    required init?(coder: NSCoder) {

//        fatalError("init(coder:) has not been implemented")
//    }
//}
//extension BooksCarruselCollectionViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dataSource?.Libro?.count ?? 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//
//}
