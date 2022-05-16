//
//  StoreAndProductPresenter.swift
//  opn-e-market
//
//  Created by Phonthep Aungkanukulwit on 16/5/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol StoreAndProductsPresenterInterface {
  func presentSomething(response: StoreAndProducts.Something.Response)
}

class StoreAndProductsPresenter: StoreAndProductsPresenterInterface {
  weak var viewController: StoreAndProductViewControllerInterface!
    
  // MARK: - Presentation logic

  func presentSomething(response: StoreAndProducts.Something.Response) {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller. The resulting view model should be using only primitive types. Eg: the view should not need to involve converting date object into a formatted string. The formatting is done here.

    let viewModel = StoreAndProducts.Something.ViewModel()
    viewController.displaySomething(viewModel: viewModel)
  }
}
