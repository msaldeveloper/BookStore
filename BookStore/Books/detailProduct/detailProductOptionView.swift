//
//  detailProductOptionView.swift
//  PujolApp
//
//  Created by Mario Saldana on 20/01/22.
//

import Foundation
import UIKit

class ProductOptionView : UIView{
    //MARK: - DEFINICION DEL PRIMER ELEMENTO
    var productContentView : UIView?
    var productImage : UIImageView?
    var productCard : UIView?
    var productName : UILabel?
    var productPrice : UILabel?
    var productDescription : UILabel?
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    init(image : String, productName : String, productPrice : Float, frame : CGRect){
        super.init(frame: frame)
        bookTarget()
        
    }
    
    func bookTarget() {
        productContentView = UIView(frame: CGRect(x: 10, y: height/5.5, width: width - 20, height: height/4))
        productContentView?.backgroundColor = .clear
        self.addSubview(productContentView!)

        productCard = UIView(frame: CGRect(x: 0, y: height/8, width: width - 20, height: height/8))
        productCard?.backgroundColor = .white
        productCard?.layer.cornerRadius = 20

        productContentView?.addSubview(productCard!)
        
        productName = UILabel(frame: CGRect(x: width/2.6, y: height/10, width: width/2, height: 100))
        productName?.text = "The Library Book"
        productName?.font = UIFont(name: "Helvetica Bold", size: 20)
        productName?.textAlignment = .left
        productName?.textColor = UIColor(red: 0, green: 0, blue: 102/255, alpha: 1)
        productContentView?.addSubview(productName!)
        
        productDescription = UILabel(frame: CGRect(x: width/2.6, y: height/7, width: width/4, height: 100))
        productDescription?.text = "Author  Categoria"
        productDescription?.numberOfLines = 2
        productDescription?.font = UIFont(name: "Helvetica", size: 18)
        productDescription?.textAlignment = .left
        productDescription?.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
        productContentView?.addSubview(productDescription!)

        productImage = UIImageView(frame: CGRect(x: 20, y: 0, width: (width - 40)/3, height: height/4 - 20))
        productImage?.backgroundColor = .blue
        productImage?.image = UIImage(named: "Book")
        productImage?.scalesLargeContentImage = true
        productContentView?.addSubview(productImage!)
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
