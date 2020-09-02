//
//  DetailCharacterPresenter.swift
//  RickMorty_CleanSwift
//
//  Created by Nithi Kulasiriswatdi on 28/8/2563 BE.
//  Copyright (c) 2563 Nithi Kulasiriswatdi. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailCharacterPresentationLogic
{
  func presentSomething(response: DetailCharacter.Something.Response)
}

class DetailCharacterPresenter: DetailCharacterPresentationLogic
{
  weak var viewController: DetailCharacterDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: DetailCharacter.Something.Response)
  {
    let viewModel = DetailCharacter.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
