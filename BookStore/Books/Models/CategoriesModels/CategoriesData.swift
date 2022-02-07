//
//  CategoriesData.swift
//  BookStore
//
//  Created by Mario Saldana on 07/02/22.
//

import Foundation

struct CategoryData: Decodable {
    let name : String
    let works :[Works]
}
struct Works: Decodable{
    let title : String
}
