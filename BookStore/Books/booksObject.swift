//
//  booksObject.swift
//  BookStore
//
//  Created by Mario Saldana on 21/01/22.
//

import Foundation
import UIKit

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
    var categoryAuthor : [Author]?
    
    init(categoryName : String, categoryAuthor : [Author]){
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
    
    init(bookTitle : String, bookPrice : Float, bookPages : Int, bookFormat : String,
         bookDescription : String, bookLanguage :String){
        self.bookTitle = bookTitle
        self.bookPrice = bookPrice
        self.bookPages = bookPages
        self.bookFormat = bookTitle
        self.bookDescription = bookDescription
        self.bookLanguage = bookLanguage
    }
}
