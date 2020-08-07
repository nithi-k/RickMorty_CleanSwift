//
//  APIRouter.swift
//  RickMorty_CleanSwift
//
//  Created by Nithi Kulasiriswatdi on 6/8/2563 BE.
//  Copyright © 2563 Nithi Kulasiriswatdi. All rights reserved.
//

import Alamofire

enum APIRouter:URLConvertible {
    func asURL() throws -> URL {
        let urlSchema = String(format: "%@%@", EnvironmentURL().getUrl, path)
        let url: URL! = URL(string: urlSchema)
        return url
    }
    
    case getAllCharacter
        var path: String {
            switch self {
            case .getAllCharacter:
                return "api/character"
            }
        }
        
}
