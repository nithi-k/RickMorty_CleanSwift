//
//  CharacterService.swift
//  RickMorty_CleanSwift
//
//  Created by Nithi Kulasiriswatdi on 6/8/2563 BE.
//  Copyright © 2563 Nithi Kulasiriswatdi. All rights reserved.
//

import RxSwift
import Alamofire
import AlamofireObjectMapper


class CharacterService {
    
    func execute(request:[String:Any],completionHandler: @escaping ([Character]?,Error?) -> Void){
        
        Alamofire.request(APIRouter.getAllCharacter,method: .get, parameters:request)
            .responseObject { (response: DataResponse<CharacterList>) in
                switch response.result  {

                    case.success(let value):
                        completionHandler(value.characters,nil)
                    case.failure(let error):
                        completionHandler(nil,error)
                }
        }
    }
    
}
