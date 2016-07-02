//
//  GlobalFunctions.swift
//  NotifyNearby
//
//  Created by Curtis Li on 4/7/16.
//  Copyright © 2016 Curtis Li. All rights reserved.
//

import UIKit

class GlobalFunctions: NSObject {
    
    class func scaleUIImageToSize(let image: UIImage, let width: CGFloat) -> UIImage {
        let hasAlpha = false
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        let ratio = image.size.height/image.size.width
        let height = width * ratio
        let size: CGSize = CGSize(width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
        image.drawInRect(CGRect(origin: CGPointZero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
    
    class func scaleUIImageToSize(let image: UIImage, let size: CGSize) -> UIImage {
        let hasAlpha = false
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
        image.drawInRect(CGRect(origin: CGPointZero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
    
    class func heightOfscaledUIImage(let image: UIImage, withWidth width: CGFloat) -> CGFloat {
        let ratio = image.size.height/image.size.width
        return width * ratio
    }
    
    class func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
    }
}
