//
//  SearcherViewController.swift
//  BookStore
//
//  Created by Mario Saldana on 11/03/22.
//

import UIKit

class SearcherViewController: UIViewController , BookManagerDelegate, DetailManagerDelegate{
    
    
    var  backImage : UIButton?
    var product : Libro?
    var topImageView : UIImageView?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var backgroundColor = UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
    var bookManager = BookManager()
    var searcherManager = DetailManager()
    var searchButton: UIButton?
    var searchBook: UIView?
    //var bookTarget :  ProductOptionView?
    //var bookDescription : ProductOptionViewDescription?
    //var bookAuthor : ProductOptionViewAuthor?
    
    var productContentView : UIView?
    var productImage : UIImageView?
    var productCard : UIView?
    var productNameTop : UILabel?
    var productName : UILabel?
    var productPrice : UILabel?
    var productDescription : UILabel?
    var seachInput : UITextField?
    var productDescriptionTop : UILabel?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        // Do any additional setup after loading the view.
        initUi()
        searcher()
        
        bookManager.delegate = self
        searcherManager.delegate = self

        
    }
    
    
    
    func searcher(){
        searchBook = UIView()
        searchBook?.backgroundColor = .white
        searchBook?.layer.cornerRadius = 10
        searchBook?.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        searchBook?.layer.borderWidth = 1
        view.addSubview(searchBook!)
        searchBook?.addAnchorsAndSize(width: nil, height: 50, left: 20, top: 0, right: 20, bottom: nil, withAnchor: .top, relativeToView: topImageView)
        
        seachInput = UITextField()
        seachInput?.placeholder = "  Ingresa tu Busqueda"
        searchBook?.addSubview(seachInput!)
        seachInput?.addAnchorsAndSize(width: nil, height: 50, left: 5, top: nil, right: 40, bottom: nil)
        
        searchButton = UIButton()
        searchButton?.backgroundColor = .clear
        searchButton?.setImage(UIImage(named: "searcher"), for: .normal)
        searchBook?.addSubview(searchButton!)
        searchButton?.addAnchorsAndSize(width: 40, height: 40, left: nil, top: 5, right: 5, bottom: 5)
        let tapRegisterButton = UITapGestureRecognizer(target: self, action: #selector(newSearchButton))
        searchButton?.addGestureRecognizer(tapRegisterButton)
        
    }
    
    
    
    func initUi() {
        topImageView = UIImageView(frame: .zero)
        topImageView?.image = UIImage(named: "topImage")
        //let frames: ()? = topImageView?.addAnchorsAndSize(width: nil, height: 150, left: 0, top: 0, right: 0, bottom: nil)
        let topImageGradient = CAGradientLayer()
        topImageGradient.frame = CGRect(x: 0, y: 0, width: width, height: 200)
        topImageGradient.colors = [UIColor.clear.cgColor, UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1).cgColor]
        topImageGradient.locations = [0.0, 1.0]
        topImageView?.layer.insertSublayer(topImageGradient, at: 0)
//        topImageView?.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1  )
//        topImageView?.layer.borderWidth = 1
        view.addSubview(topImageView!)
        topImageView?.addAnchorsAndSize(width: nil, height: 200, left: 0, top: 0, right: 0, bottom: nil)
        
        topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width - 40, height: height/4))
        topImageView?.image = UIImage(named: "topimage")
        view.addSubview(topImageView!)
        
        backImage = UIButton()
        backImage?.setImage(UIImage(named: "back"), for: .normal)
        backImage?.addTarget(self, action:#selector(backAction) , for: .touchUpInside)
        backImage?.tintColor = UIColor.red
        view.addSubview(backImage!)
        backImage?.addAnchorsAndSize(width: 30, height: 30, left: 20, top: 55, right: nil, bottom: nil)
        
        
        
        
    }
    @objc func backAction(){
        
        print("Back")
        dismiss(animated: true)
    }
    
    func bookTarget() {
        productContentView = UIView(frame: CGRect(x: 10, y: height/3, width: width - 20, height: height/4))
        productContentView?.backgroundColor = .clear
        view.addSubview(productContentView!)

        productCard = UIView(frame: CGRect(x: 0, y: height/8, width: width - 20, height: height/8))
        productCard?.backgroundColor = .white
        productCard?.layer.cornerRadius = 20

        productContentView?.addSubview(productCard!)
        
        productNameTop = UILabel(frame: CGRect(x: width/2.6, y: height/10, width: width/2, height: 100))
        productNameTop?.text = product?.bookTitle
        productNameTop?.font = UIFont(name: "Helvetica Bold", size: 20)
        productNameTop?.textAlignment = .left
        productNameTop?.text = "hola"
        productNameTop?.textColor = UIColor(red: 0, green: 0, blue: 102/255, alpha: 1)
        productContentView?.addSubview(productNameTop!)
        
        productDescriptionTop = UILabel(frame: CGRect(x: width/2.6, y: height/7, width: width/4, height: 100))
        productDescriptionTop?.text = "\(String(describing: product?.author?.authorName ?? ""))"
        productDescriptionTop?.numberOfLines = 2
        productDescriptionTop?.font = UIFont(name: "Helvetica", size: 18)
        productDescriptionTop?.textAlignment = .left
        productDescriptionTop?.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        productContentView?.addSubview(productDescriptionTop!)

        productImage = UIImageView(frame: CGRect(x: 20, y: 0, width: (width - 40)/3, height: height/4 - 20))
        productImage?.backgroundColor = .clear
        
        let image = NSString(string: product?.bookImage ?? "")
        print (image)
        switch image {
        case "el señor de los anillos":
            productImage?.image = UIImage(named:"lordOf")
        case "historias mexicas":
            productImage?.image = UIImage(named:"mexicas")
        case "el origen de las especies":
            productImage?.image = UIImage(named:"especies")
        case "vidaEntreVidas":
            productImage?.image = UIImage(named:"vidaEntreVidas")
        case "el filo de la navaja":
            productImage?.image = UIImage(named:"navaja")
        case "el castillo ambulante":
            productImage?.image = UIImage(named:"castillo")
        case "el origen de la trajedia":
            productImage?.image = UIImage(named:"trajedia")
        default:
            productImage?.image = UIImage(named:"book")
        }

        
        //productImage?.image = UIImage(named: "Book")
        productImage?.scalesLargeContentImage = true
        productContentView?.addSubview(productImage!)
    }
    
    func bookDescription() {
        productContentView = UIView(frame: CGRect(x: 10, y: height/1.65, width: width - 20, height: height/3))
        productContentView?.backgroundColor = .white
        productContentView?.layer.cornerRadius = 20
        view.addSubview(productContentView!)
        
        productName = UILabel(frame: CGRect(x: 30, y: 0, width: width/1.5, height: 100))
        productName?.font = UIFont(name: "Helvetica", size: 18)
        productName?.text = "Datos Libro"
        productName?.textAlignment = .left
        productName?.textColor = UIColor(red: 0, green: 0, blue: 102/255, alpha: 1)
        productContentView?.addSubview(productName!)

        
    
        productDescription = UILabel(frame: CGRect(x: 30, y: 70, width: width/2 + 130 - 30, height: 120))
        productDescription?.backgroundColor = .clear
        productDescription?.numberOfLines = 0
        productDescription?.font = UIFont(name: "Helvetica", size: 15)
        productDescription?.sizeToFit()
        productDescription?.textAlignment = .left
        productDescription?.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        productContentView?.addSubview(productDescription!)
    }
    
    func searButton(){
        
    }
    @objc func newSearchButton() {
        
        bookManager.fetchBook(bookName: seachInput?.text ?? "")
        searcherManager.fetchDetail(bookName: seachInput?.text ?? "")
        //drinkManager.getDrink(drinkName: drinkInput?.text ?? "")
        


    }
    func didUpdateBook(_ bookManager: BookManager, bookid: BookModel) {
            DispatchQueue.main.async {
                self.bookTarget()
                self.bookDescription()
                //searButton()
                
                print("\(bookid.edition ?? "")  \(bookid.key ?? "")  \(bookid.author_key ?? "")  \(bookid.first ?? 0)")
                self.productNameTop?.text = "\(bookid.title)"
                self.productNameTop?.lineBreakMode = .byWordWrapping
                self.productNameTop?.numberOfLines = 0
                self.productDescriptionTop?.text = "\(bookid.author_name ?? "")"
                self.productName?.text = "Author: \(bookid.author_name ?? "" )     Edition: \(bookid.edition ?? "")        key Libro \(bookid.key ?? "")       Año Publicacion: \(bookid.first ?? 0)"
                self.productName?.lineBreakMode = .byWordWrapping
                self.productName?.numberOfLines = 0
                
            }

        }
    
    func didUpdateDetail(_ detailManager: DetailManager, detailid: DetailModel) {
        print("AAAAAAAAA",detailid.description)
    }
        
//    func didUpdateBook(_ bookManager: BookManager, bookid: BookModel) {
//
//        print("Aaaaa", bookid.title)
//    }
    
}

