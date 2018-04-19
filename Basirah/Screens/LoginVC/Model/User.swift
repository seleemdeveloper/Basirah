//
//  User.swift
//  Basirah
//
//  Created by Ahmed seleem on 4/16/18.
//  Copyright © 2018 Ahmed seleem. All rights reserved.
//

import Foundation
import RealmSwift


class User: Object
{
    @objc dynamic var name: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var userType:UserType = .requester
}



@objc
enum UserType:Int
{
    case requester 
    case voulunteer
}
/*

class Request: Object
{
    @objc dynamic var category: String = ""
    @objc dynamic var finalDate: Date = Date()
    @objc dynamic var bookName: String = ""
    @objc dynamic var response: Response = Response()
}

class Response: Object
{
    @objc dynamic var audioFileURL: String = ""
    @objc dynamic var user: User = User()
}*/
