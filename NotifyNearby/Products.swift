//
//  Products.swift
//  NotifyNearby
//
//  Created by Curtis Li on 4/8/16.
//  Copyright © 2016 Curtis Li. All rights reserved.
//

import Foundation
import UIKit

class Products : NSObject {
    var products : [Product]
    let kBaseUrl : String = "https://api.shopstyle.com/api/v2/products/"
    let apiKey : String = "uid3001-33215251-40"
    
    override init() {
        self.products = [Product]()
        super.init()
    }
    
    func addProduct(product: Product) -> Product {
        self.products.append(product)
        print("Added product, COUNT:", self.getCount())
        return product
    }
    
    func getCount() -> Int {
        return self.products.count
    }
    
    func getProductAtIndex(index: Int) -> Product? {
        return products[index]
    }
    
    func importProductId(productId: String) {
        let urlPath = self.kBaseUrl + productId + "?pid=" + apiKey
        print(urlPath)
        let url = NSURL(string: urlPath)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            do {
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                    let product : Product = Product(productName: jsonResult["name"] as! String, productId: String(jsonResult["id"] as! Int), productImageURL: jsonResult["image"]!["sizes"]!!["IPhone"]!!["url"] as! String, price: jsonResult["price"] as! Float)
                    self.addProduct(product)
                }
            } catch {
                print("error")
            }
        })
        
        task.resume()
    }
}