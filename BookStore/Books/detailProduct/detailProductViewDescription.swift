//
//  detailProductViewDescription.swift
//  PujolApp
//
//  Created by Mario Saldana on 20/01/22.
//

import Foundation
import UIKit

class ProductOptionViewDescription : UIView{
    //MARK: - DEFINICION DEL PRIMER ELEMENTO
    var productContentView : UIView?
    var productImage : UIImageView?
    var productCard : UIView?
    var productName : UILabel?
    var productPrice : UILabel?
    var productDescription : UILabel?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    init(descripcion : String, detalles : String,  frame : CGRect){
        super.init(frame: frame)
        bookDescription()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bookDescription() {
        productContentView = UIView(frame: CGRect(x: 10, y: height/2.2, width: width - 20, height: height/4))
        productContentView?.backgroundColor = .white
        productContentView?.layer.cornerRadius = 20
        self.addSubview(productContentView!)
        
        productName = UILabel(frame: CGRect(x: 30, y: 0, width: width/2, height: 100))
        productName?.text = "Descripción"
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
        productDescription?.text = "by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by Rackham"
        productDescription?.numberOfLines = 0
        productDescription?.font = UIFont(name: "Helvetica", size: 15)
        productDescription?.sizeToFit()
        productDescription?.textAlignment = .left
        productDescription?.textColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        productContentView?.addSubview(productDescription!)
    }
}
