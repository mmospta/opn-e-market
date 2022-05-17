//
//  ProductTableViewCell.swift
//  opn-e-market
//
//  Created by Phonthep Aungkanukulwit on 17/5/2565 BE.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
  
  @IBOutlet weak var checkBox: UIButton!
  @IBOutlet weak var productImage: UIImageView!
  @IBOutlet weak var productName: UILabel!
  @IBOutlet weak var price: UILabel!
  @IBOutlet weak var quantity: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16))
  }
  
  func setup(product: Product) {
    productName.text = product.name
    price.text = "$ \(product.price)"
  }
  
  @IBAction func didTappedCheckBox() {
    print("tap checkbox")
  }
  @IBAction func didAdd() {
    print("add")
  }
  @IBAction func didSubtract() {
    print("subtract")
  }
  
}
