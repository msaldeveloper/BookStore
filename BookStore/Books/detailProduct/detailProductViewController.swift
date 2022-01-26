//
//  detailProductViewController.swift
//  PujolApp
//
//  Created by Mario Saldana on 19/01/22.
//

import UIKit

class detailProductViewController: UIViewController {
    var topImageView : UIImageView?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var backgroundColor = UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1)

    var bookTarget :  ProductOptionView?
    var bookDescription : ProductOptionViewDescription?
    var bookAuthor : ProductOptionViewAuthor?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        // Do any additional setup after loading the view.
        initUi()
    }
    
    func initUi() {
        topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width - 40, height: height/4))
        topImageView?.image = UIImage(named: "topimage")
        view.addSubview(topImageView!)
        
        bookTarget = ProductOptionView(image: "book", productName: "book", productPrice: 150.0, frame: CGRect(x: 0, y: 0, width: width - 40, height: height/4))
        view.addSubview(bookTarget!)
        
        bookDescription = ProductOptionViewDescription(descripcion: "libro pasta dura", detalles: "cuentos", frame: CGRect(x: 0, y: 0, width: width - 40, height: height/4))
        view.addSubview(bookDescription!)
        
        bookAuthor = ProductOptionViewAuthor(image: "book", authorName: "mario", description: "libro cuentos", frame: CGRect(x: 0, y: 0, width: width - 40, height: height/4))
        view.addSubview(bookAuthor!)
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
