//
//  detailBookViewController.swift
//  BookStore
//
//  Created by Mario Saldana on 25/01/22.
//

import Foundation
//
//  detailProductViewController.swift
//  PujolApp
//
//  Created by Mario Saldana on 19/01/22.
//

import UIKit

class detailProductViewController: UIViewController {
    var  backImage : UIButton?
    var product : Libro?
    var topImageView : UIImageView?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var backgroundColor = UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
    //var bookTarget :  ProductOptionView?
    //var bookDescription : ProductOptionViewDescription?
    //var bookAuthor : ProductOptionViewAuthor?
    
    var productContentView : UIView?
    var productImage : UIImageView?
    var productCard : UIView?
    var productName : UILabel?
    var productPrice : UILabel?
    var productDescription : UILabel?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        // Do any additional setup after loading the view.
        initUi()
        bookTarget()
        bookDescription()
        bookAuthor()
        
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
    
    func bookDescription() {
        productContentView = UIView(frame: CGRect(x: 10, y: height/2.2, width: width - 20, height: height/4))
        productContentView?.backgroundColor = .white
        productContentView?.layer.cornerRadius = 20
        view.addSubview(productContentView!)
        
        productName = UILabel(frame: CGRect(x: 30, y: 0, width: width/2, height: 100))
        productName?.text = "Descripcion"
        productName?.font = UIFont(name: "Helvetica", size: 18)
        productName?.textAlignment = .left
        productName?.textColor = UIColor(red: 0, green: 0, blue: 102/255, alpha: 1)
        productContentView?.addSubview(productName!)
        
        productName = UILabel(frame: CGRect(x: width/2 - 15 , y: 0, width: width/2, height: 100))
        productName?.text = "|        Detalles"
        productName?.font = UIFont(name: "Helvetica", size: 18)
        productName?.textAlignment = .left
        productName?.textColor = UIColor(red: 0, green: 0, blue: 102/255, alpha: 1)
        productContentView?.addSubview(productName!)
        
    
        productDescription = UILabel(frame: CGRect(x: 30, y: 70, width: width/2 + 130 - 30, height: 120))
        productDescription?.backgroundColor = .clear
        productDescription?.text = product?.bookDescription
        productDescription?.numberOfLines = 0
        productDescription?.font = UIFont(name: "Helvetica", size: 15)
        productDescription?.sizeToFit()
        productDescription?.textAlignment = .left
        productDescription?.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        productContentView?.addSubview(productDescription!)
    }
    
    func bookAuthor() {
        productContentView = UIView(frame: CGRect(x: 10, y: height/1.38, width: width - 20, height: height/4))
        productContentView?.backgroundColor = .white
        productContentView?.layer.cornerRadius = 20
        view.addSubview(productContentView!)
        
        productName = UILabel(frame: CGRect(x: 100, y: 0, width: width/2, height: 100))
        productName?.text = "Sobre el Autor"
        productName?.font = UIFont(name: "Helvetica", size: 20)
        productName?.textAlignment = .left
        productName?.textColor = UIColor(red: 0, green: 0, blue: 102/255, alpha: 1)
        productContentView?.addSubview(productName!)
        
        productName = UILabel(frame: CGRect(x: 100  , y: 30, width: width/1.2, height: 100))
        productName?.text = product?.author
        productName?.font = UIFont(name: "Helvetica", size: 25)
        productName?.textAlignment = .left
        productName?.textColor = UIColor(red: 0, green: 0, blue: 102/255, alpha: 1)
        productContentView?.addSubview(productName!)
        
        productImage = UIImageView(frame: CGRect(x: 5, y: 10, width: 100, height:  100))
        productImage?.backgroundColor = .clear
        productImage?.image = UIImage(named: "profile")
        productImage?.scalesLargeContentImage = true
        productContentView?.addSubview(productImage!)
        
        productDescription = UILabel(frame: CGRect(x: 30, y: 100, width: width/2 + 130 - 30, height: 120))
        productDescription?.backgroundColor = .clear
        productDescription?.text = "by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by Rackham"
        productDescription?.numberOfLines = 0
        productDescription?.font = UIFont(name: "Helvetica", size: 15)
        productDescription?.sizeToFit()
        productDescription?.textAlignment = .left
        productDescription?.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        productContentView?.addSubview(productDescription!)
    
        
        productDescription = UILabel(frame: CGRect(x: width - 120, y: 180, width: width/2 + 130 - 30, height: 120))
        productDescription?.backgroundColor = .clear
        productDescription?.text = "Mas Titulos del Autor"
        productDescription?.numberOfLines = 0
        productDescription?.font = UIFont(name: "Helvetica", size: 10)
        productDescription?.sizeToFit()
        productDescription?.textAlignment = .right
        productDescription?.textColor = UIColor(red: 0, green: 0, blue: 102/255, alpha: 1)
        productContentView?.addSubview(productDescription!)
    }
    
    func bookTarget() {
        productContentView = UIView(frame: CGRect(x: 10, y: height/5.5, width: width - 20, height: height/4))
        productContentView?.backgroundColor = .clear
        view.addSubview(productContentView!)

        productCard = UIView(frame: CGRect(x: 0, y: height/8, width: width - 20, height: height/8))
        productCard?.backgroundColor = .white
        productCard?.layer.cornerRadius = 20

        productContentView?.addSubview(productCard!)
        
        productName = UILabel(frame: CGRect(x: width/2.6, y: height/10, width: width/2, height: 100))
        productName?.text = product?.bookTitle
        productName?.font = UIFont(name: "Helvetica Bold", size: 20)
        productName?.textAlignment = .left
        productName?.textColor = UIColor(red: 0, green: 0, blue: 102/255, alpha: 1)
        productContentView?.addSubview(productName!)
        
        productDescription = UILabel(frame: CGRect(x: width/2.6, y: height/7, width: width/4, height: 100))
        productDescription?.text = "\(String(describing: product?.author ?? ""))"
        productDescription?.numberOfLines = 2
        productDescription?.font = UIFont(name: "Helvetica", size: 18)
        productDescription?.textAlignment = .left
        productDescription?.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        productContentView?.addSubview(productDescription!)

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
//    func createProductView(){
//        productContentView = UIView(frame: CGRect(x: 10, y: height/5, width: width - 20, height: height/4))
//        productContentView?.backgroundColor = .red
//        view.addSubview(productContentView!)
//
//        productCard = UIView(frame: CGRect(x: 10, y: height/8, width: width - 40, height: height/8))
//        productCard?.backgroundColor = .white
//        productCard?.layer.cornerRadius = 20
//
//        productContentView?.addSubview(productCard!)
//
//        productImage = UIImageView(frame: CGRect(x: 20, y: 0, width: (width - 40)/3, height: height/4 - 20))
//        productImage?.backgroundColor = .blue
//
//        productContentView?.addSubview(productImage!)
//
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

