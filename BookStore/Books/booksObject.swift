//
//  booksObject.swift
//  BookStore
//
//  Created by Mario Saldana on 21/01/22.
//

import Foundation
import UIKit
class bookObject{
    var authorName : [Author]?
    
    init(authorName : [Author]){
        self.authorName = authorName
    }
}

class Author {
    var authorName : String?
    var authorBooks : [Libro]?
    var categoryName : String?
    
    init(authorName : String, authorBooks : [Libro], categoryName : String?){
        self.authorName = authorName
        self.authorBooks = authorBooks
        self.categoryName = categoryName
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
    var categoria : Category?
    
    init(bookTitle : String, bookPrice : Float, bookPages : Int, bookFormat : String,
         bookDescription : String, bookLanguage :String, bookImage : String?){
        self.bookTitle = bookTitle
        self.bookPrice = bookPrice
        self.bookPages = bookPages
        self.bookFormat = bookTitle
        self.bookDescription = bookDescription
        self.bookLanguage = bookLanguage
        self.bookImage = bookImage
    }
}
