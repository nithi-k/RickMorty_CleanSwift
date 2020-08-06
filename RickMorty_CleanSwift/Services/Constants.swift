//
//  Constants.swift
//  RickMorty_CleanSwift
//
//  Created by Nithi Kulasiriswatdi on 6/8/2563 BE.
//  Copyright © 2563 Nithi Kulasiriswatdi. All rights reserved.
//

import Foundation

struct EnvironmentURL {
    
    private struct EnvironmentURLConstants {
  
        static let uat = "https://rickandmortyapi.com/"
   
    }

    
    var getUrl: String {
      
         return EnvironmentURLConstants.uat
    }
    
  
    
}
