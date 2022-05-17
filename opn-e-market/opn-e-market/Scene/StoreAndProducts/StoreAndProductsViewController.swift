//
//  StoreAndProductViewController.swift
//  opn-e-market
//
//  Created by Phonthep Aungkanukulwit on 16/5/2565 BE.
//  Copyright (c) 2565 BE ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol StoreAndProductViewControllerInterface: AnyObject {
  func displaySomething(viewModel: StoreAndProducts.Something.ViewModel)
}

class StoreAndProductsViewController: UIViewController, StoreAndProductViewControllerInterface, UITableViewDelegate {
  var interactor: StoreAndProductsInteractorInterface!
  var router: StoreAndProductsRouter!

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
  
  // MARK: - Object lifecycle

  override func awakeFromNib() {
    super.awakeFromNib()
    configure(viewController: self)
  }

  // MARK: - Configuration

  private func configure(viewController: StoreAndProductsViewController) {
    let router = StoreAndProductsRouter()
    router.viewController = viewController

    let presenter = StoreAndProductsPresenter()
    presenter.viewController = viewController

    let interactor = StoreAndProductsInteractor()
    interactor.presenter = presenter
    interactor.worker = StoreAndProductsWorker(store: StoreAndProductsStore())

    viewController.interactor = interactor
    viewController.router = router
  }

  // MARK: - View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "productCell")
    tableView.isScrollEnabled = false
    
    doSomethingOnLoad()
  }
  
  override func viewWillLayoutSubviews() {
    DispatchQueue.main.async {
      self.tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
//      self.tableViewHeight.constant = self.tableView.contentSize.height
    }
  }

  // MARK: - Event handling

  func doSomethingOnLoad() {
    // NOTE: Ask the Interactor to do some work

    let request = StoreAndProducts.Something.Request()
    interactor.getStoreInfo(request: request)
  }

  // MARK: - Display logic

  func displaySomething(viewModel: StoreAndProducts.Something.ViewModel) {
    // NOTE: Display the result from the Presenter

    // nameTextField.text = viewModel.name
  }

  // MARK: - Router

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    router.passDataToNextScene(segue: segue)
  }

  @IBAction func unwindToStoreAndProductViewController(from segue: UIStoryboardSegue) {
    print("unwind...")
    router.passDataToNextScene(segue: segue)
  }
}

extension StoreAndProductsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductTableViewCell else {
      return UITableViewCell()
    }
    return cell
  }
}
