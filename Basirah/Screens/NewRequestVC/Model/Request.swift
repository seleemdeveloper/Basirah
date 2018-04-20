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
    
    static let requesterName = "requesterName"
    static let bookName = "bookName"
    static let bookAuthor = "bookAuthor"
    static let bookCategory = "bookCategory"
    static let dueDate = "dueDate"
    
    static let response = "response"
    
}


class Request: Mappable
{
    
    var requestOwner: String!
    var requestTimestamp: String!
    var bookDate: String!
    
    var requesterName: String!
    var bookName: String!
    var bookAuthor: String!
    var bookCategory: String!
    var bookDueDate: String!
    
    var response: Response?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        
        requesterName <- map[RequestKeys.requesterName]
        bookName <- map[RequestKeys.bookName]
        bookAuthor <- map[RequestKeys.bookAuthor]
        bookCategory <- map[RequestKeys.bookCategory]
        bookDueDate <- map[RequestKeys.dueDate]
        
        
        response <- map[RequestKeys.response]
    }
}

struct ResponseKeys
{
    static let date = "date"
    static let url = "url"
    static let volunteer = "volunteer"
    static let volunteerName = "volunteerName"
    
}


class Response: Mappable
{
    var volunteer: String!
    var volunteerName: String!
    var url: String!
    var date: String!
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        
        volunteer <- map[ResponseKeys.volunteer]
        volunteerName <- map[ResponseKeys.volunteerName]
        url <- map[ResponseKeys.url]
        date <- map[ResponseKeys.date]
    }
}

