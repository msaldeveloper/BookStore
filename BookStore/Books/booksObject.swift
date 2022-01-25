//
//  booksObject.swift
//  BookStore
//
//  Created by Mario Saldana on 21/01/22.
//

import Foundation
import UIKit
class bookObject{
    var categoryName : [Category]?
    var authorName : [Author]?
    init(authorName : [Author],categoryName : [Category]){
        self.authorName = authorName
        self.categoryName = categoryName
    }
}

class Author {
    var authorName : String?
    var authorBooks : [Libro]?
    var authorCategory : [Category]?
    
    init(authorName : String, authorBooks : [Libro], authorCategory : [Category]){
        self.authorName = authorName
        self.authorBooks = authorBooks
        self.authorCategory = authorCategory
    }
}

class Category {
    var categoryName : String?
    
    init(categoryName : String){
        self.categoryName = categoryName
        self.categoryAuthor = categoryAuthor
        
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
