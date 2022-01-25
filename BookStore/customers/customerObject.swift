//
//  customerObject.swift
//  BookStore
//
//  Created by Mario Saldana on 21/01/22.
//

import Foundation
import UIKit

class Customer {
    var name : String?
    var email : String?
    var password : String?
    init(name : String, email : String, password : String){
        self.name = name
        self.email = email
        self.password = password
    }
}
