//
//  Product_Cell.swift
//  NotifyNearby
//
//  Created by Curtis Li on 4/9/16.
//  Copyright © 2016 Curtis Li. All rights reserved.
//

import UIKit

class Product_Cell: UICollectionViewCell {

    @IBOutlet weak var productImage : UIImageView!
    @IBOutlet weak var productName : UILabel!
    @IBOutlet weak var productPrice : UILabel!
    
    var product: Product!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func initWithProduct(product: Product) {
        self.product = product
        self.productName.text = product.productName
        self.productPrice.text = String(format: "$%.2f", product.price)
        self.productImage.image = product.productImage!
    }
    
}
