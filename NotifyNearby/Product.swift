//
//  Product.swift
//  NotifyNearby
//
//  Created by Curtis Li on 4/8/16.
//  Copyright © 2016 Curtis Li. All rights reserved.
//

import UIKit

class Product : NSObject {
    
    var productName: String
    var productId: String
    var productImage: UIImage?
    var productImageURL: NSURL
    var price: Float
    
    // MARK: Initialization
    
    init(productName: String, productId: String, productImageURL: String, price: Float) {
        self.productName = productName
        self.productId = productId
        self.productImageURL = NSURL(string: productImageURL)!
        self.price = price
        super.init()
        
        self.downloadImage()
    }
    
    func downloadImage(){
        GlobalFunctions.getDataFromUrl(self.productImageURL) { (data, response, error)  in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                self.productImage = UIImage(data: data)
            }
        }
    }
}