//
//  CharacterWorkers.swift
//  RickMorty_CleanSwift
//
//  Created by Nithi Kulasiriswatdi on 6/8/2563 BE.
//  Copyright © 2563 Nithi Kulasiriswatdi. All rights reserved.
//

import Foundation

class CharacterWorkers:CharactersServiceProtocol
{
    private var charactersService: CharacterService
    
    init(charactersService:CharacterService) {
        self.charactersService = charactersService
    }
    
    func fetchCharacters(request: ListCharacters.FetchCharacters.Request, completionHandler: @escaping ([Character]?, Error?) -> Void) {
        
        charactersService.execute(request: request.dictionary ?? ["":""], completionHandler: completionHandler)
    }
    func searchCharacters(request: SearchCharaters.FetchSearch.Request, completionHandler: @escaping ([Character]?, Error?) -> Void) {
        
        charactersService.execute(request: request.dictionary ?? ["":""], completionHandler: completionHandler)
    }
    
}
protocol CharactersServiceProtocol{
    
    func fetchCharacters(request: ListCharacters.FetchCharacters.Request, completionHandler: @escaping ([Character]?, Error?) -> Void)
    func searchCharacters(request: SearchCharaters.FetchSearch.Request, completionHandler: @escaping ([Character]?, Error?) -> Void)
}


