//
//  StoreAndProductWorker.swift
//  opn-e-market
//
//  Created by Phonthep Aungkanukulwit on 16/5/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol StoreAndProductsStoreProtocol {
  func getStoreInfo(_ completion: @escaping (Result<Store, APIError>) -> Void)
  func getProducts(_ completion: @escaping (Result<Products, APIError>) -> Void)
  func postOrder(order: Order, _ completion: @escaping (Result<Void, APIError>) -> Void)
}

class StoreAndProductsWorker {

  var store: StoreAndProductsStoreProtocol

  init(store: StoreAndProductsStoreProtocol) {
    self.store = store
  }

  // MARK: - Business Logic

  func getStoreInfo(_ completion: @escaping (Result<Store, APIError>) -> Void) {
    store.getStoreInfo {
      completion($0)
    }
  }
  
  func getProducts(_ completion: @escaping (Result<Products, APIError>) -> Void) {
    store.getProducts {
      completion($0)
    }
  }
  
  func postOrder(order: Order, _ completion: @escaping (Result<Void, APIError>) -> Void) {
    store.postOrder(order: order) {
      completion($0)
    }
  }
}
