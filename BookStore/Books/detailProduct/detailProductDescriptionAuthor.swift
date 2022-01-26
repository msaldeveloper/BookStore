//
//  detailProductDescriptionAuthor.swift
//  PujolApp
//
//  Created by Mario Saldana on 20/01/22.
//

import Foundation

import UIKit

class ProductOptionViewAuthor : UIView{
    //MARK: - DEFINICION DEL PRIMER ELEMENTO
    var productContentView : UIView?
    var productImage : UIImageView?
    var productCard : UIView?
    var productName : UILabel?
    var productPrice : UILabel?
    var productDescription : UILabel?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    init(image : String, authorName : String, description : String, frame : CGRect){
        super.init(frame: frame)
        bookAuthor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bookAuthor() {
        productContentView = UIView(frame: CGRect(x: 10, y: height/1.38, width: width - 20, height: height/4))
        productContentView?.backgroundColor = .white
        productContentView?.layer.cornerRadius = 20
        self.addSubview(productContentView!)
        
        productName = UILabel(frame: CGRect(x: 100, y: 0, width: width/2, height: 100))
        productName?.text = "Sobre el Autor"
        productName?.font = UIFont(name: "Helvetica", size: 20)
        productName?.textAlignment = .left
        productName?.textColor = UIColor(red: 0, green: 0, blue: 102/255, alpha: 1)
        productContentView?.addSubview(productName!)
        
        productName = UILabel(frame: CGRect(x: 100  , y: 30, width: width/1.2, height: 100))
        productName?.text = "Nombre Del Autor"
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
}
