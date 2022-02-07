//
//  AuthorsData.swift
//  BookStore
//
//  Created by Mario Saldana on 07/02/22.
//

import Foundation

import Foundation

struct AuthorData: Decodable {
    let docs: [Doc]
}

struct Doc: Decodable {
    let name: String
    let birth_date, top_work: String?
    let key: String
}
