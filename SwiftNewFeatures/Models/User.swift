//
//  User.swift
//  SwiftNewFeatures
//
//  Created by shehan karunarathna on 2022-02-14.
//

import Foundation

struct User:Identifiable, Decodable{
    var id:Int
    var name:String
    var email:String
}

