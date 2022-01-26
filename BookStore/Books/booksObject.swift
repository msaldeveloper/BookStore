//
//  booksObject.swift
//  BookStore
//
//  Created by Mario Saldana on 21/01/22.
//

import Foundation
import UIKit
class bookObject{
    var Libro : [Libro]?
    var Categoria : [Categoria]?
    
    init(Libro : [Libro], Categoria : [Categoria]){
        self.Libro = Libro
        self.Categoria = Categoria
    }
}




class Libro {
    var bookTitle : String?
    var bookPrice : Float?
    var bookPages : Int?
    var bookFormat : String?
    var bookDescription : String?
    var bookLanguage : String?
    var bookImage : String?
    var author : Author?
    var categoria : Categoria?
    
    init(bookTitle : String, bookPrice : Float, bookPages : Int, bookFormat : String,
         bookDescription : String, bookLanguage :String, bookImage : String, author : Author, categoria : Categoria){
        self.bookTitle = bookTitle
        self.bookPrice = bookPrice
        self.bookPages = bookPages
        self.bookFormat = bookTitle
        self.bookDescription = bookDescription
        self.bookLanguage = bookLanguage
        self.bookImage = bookImage
        self.author = author
        self.categoria = categoria
    }
}

class Author {
    var authorName : String?
    
    init(authorName : String){
        self.authorName = authorName
       
    }
}

class Categoria {
    var categoria : String?
    
    init(categoria : String){
        self.categoria = categoria
    }
}
