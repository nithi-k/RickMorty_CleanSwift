//
//  Character.swift
//  RickMorty_CleanSwift
//
//  Created by Nithi Kulasiriswatdi on 6/8/2563 BE.
//  Copyright © 2563 Nithi Kulasiriswatdi. All rights reserved.
//

import Foundation
import ObjectMapper

class CharacterList: Mappable
{
    var characters: [Character]?
    
    required init?(map: Map) {}

    func mapping(map: Map) {
        characters <- map["results"]

    }
}

class Character: Mappable
{
  var name: String?
  var status: String?
  var imageURL: String?
    
    required init?(map: Map) {}

    func mapping(map: Map) {
        name <- map["name"]
        status <- map["status"]
        imageURL <- map["image"]
    }
}


