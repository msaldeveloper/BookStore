//
//  BookData.swift
//  BookStore
//
//  Created by Mario Saldana on 07/02/22.
//

import Foundation

struct BookData: Decodable {
    let docs :[Docs]
}
struct Docs: Decodable{
    let title : String
    let edition_key: [String]?
    let first_publish_year : Int?
    let key : String?
    let author_name: [String]?
    let author_key : [String]?
}
