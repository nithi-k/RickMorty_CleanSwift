//
//  SearchCharatersPresenter.swift
//  RickMorty_CleanSwift
//
//  Created by Nithi Kulasiriswatdi on 7/8/2563 BE.
//  Copyright (c) 2563 Nithi Kulasiriswatdi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SearchCharatersPresentationLogic
{
  func presentFetchedSearchResult(response: SearchCharaters.FetchSearch.Response)
}

class SearchCharatersPresenter: SearchCharatersPresentationLogic
{
  weak var viewController: SearchCharatersDisplayLogic?
  
  // MARK: Do something
  
  func presentFetchedSearchResult(response: SearchCharaters.FetchSearch.Response)
  {
    var displayedSearchResults: [SearchCharaters.FetchSearch.ViewModel.DisplaySearchResult] = []
    
    for character in response.characters{
        let displaySearchResult = SearchCharaters.FetchSearch.ViewModel.DisplaySearchResult(name: character.name ?? "No Name")
        displayedSearchResults.append(displaySearchResult)
    }
    let viewModel = SearchCharaters.FetchSearch.ViewModel(displaySearchResult: displayedSearchResults)
    viewController?.displayFetchSearchResults(viewModel: viewModel)
  }
}