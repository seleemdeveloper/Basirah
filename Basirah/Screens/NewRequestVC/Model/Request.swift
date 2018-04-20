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
    var requestOwner: String!
    var bookDate: String!

    var bookName: String!
    var bookAuthor: String!
    var bookCategory: String!
    var bookDueDate: String!
    
    var response: Response?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        
        bookName <- map[RequestKeys.bookName]
        bookAuthor <- map[RequestKeys.bookAuthor]
        bookCategory <- map[RequestKeys.bookCategory]
        bookDueDate <- map[RequestKeys.dueDate]
    }
}

struct ResponseKeys
{
    static let date = "date"
    static let url = "url"
    static let volunteer = "volunteer"
    
}


class Response: Mappable
{
    var volunteer: String!
    var url: String!
    var date: String!
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        
        volunteer <- map[ResponseKeys.volunteer]
        url <- map[ResponseKeys.url]
        date <- map[ResponseKeys.date]
    }
}

