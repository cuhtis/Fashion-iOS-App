//
//  Brands.swift
//  NotifyNearby
//
//  Created by Curtis Li on 4/7/16.
//  Copyright © 2016 Curtis Li. All rights reserved.
//

import UIKit

class Brand : NSObject {
    
    var brandName: String
    var brandId: String
    var brandDescTitle: String
    var brandDesc: String
    var logoImage: UIImage?
    var posterImage: UIImage?
    var liked: Bool
    var products: Products
    
    // MARK: Initialization
    
    init(brandName: String, brandId: String, brandDescTitle: String, brandDesc: String, logo: UIImage?, poster: UIImage?, productIds: [String]) {
        self.brandName = brandName
        self.brandId = brandId
        self.brandDescTitle = brandDescTitle
        self.brandDesc = brandDesc
        self.logoImage = logo
        self.posterImage = poster
        self.liked = false
        self.products = Products()
        
        for id in productIds {
            self.products.importProductId(id)
        }
        
        super.init()
    }
    
}
