//
//  StoreAndProductInteractor.swift
//  opn-e-market
//
//  Created by Phonthep Aungkanukulwit on 16/5/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol StoreAndProductsInteractorInterface {
  func getStoreInfo(request: StoreAndProducts.Something.Request)
}

class StoreAndProductsInteractor: StoreAndProductsInteractorInterface {
  var presenter: StoreAndProductsPresenterInterface!
  var worker: StoreAndProductsWorker?

  // MARK: - Business logic

  func getStoreInfo(request: StoreAndProducts.Something.Request) {
    worker?.getStoreInfo { [weak self] result in
      let response = StoreAndProducts.Something.Response()
      self?.presenter.presentSomething(response: response)
    }
  }
}
