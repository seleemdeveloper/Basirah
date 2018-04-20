//
//  Request.swift
//  Basirah
//
//  Created by Ahmed Seleem on 4/20/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import ObjectMapper

struct RequestKeys
{
    static let mainKey = "requests"
    
    static let bookName = "bookName"
    static let bookAuthor = "bookAuthor"
    static let bookCategory = "bookCategory"
    static let dueDate = "dueDate"
}


class Request: Mappable
{
    
    var bookName: String!
    var bookAuthor: String!
    var bookCategory: String!
    var bookDueDate: String!
    var bookDate: String!
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        
        bookName <- map[RequestKeys.bookName]
        bookAuthor <- map[RequestKeys.bookAuthor]
        bookCategory <- map[RequestKeys.bookCategory]
        bookDueDate <- map[RequestKeys.dueDate]
    }
}

