//
//  Brands.swift
//  NotifyNearby
//
//  Created by Curtis Li on 4/7/16.
//  Copyright © 2016 Curtis Li. All rights reserved.
//

import UIKit

class Brands : NSObject {

    var brands : [Brand]

    override init() {
        let pic = UIImage(named: "Pic.jpg")
        let pic2 = UIImage(named: "Pic2.jpg")
        
        let tory = Brand(brandName: "Tory Burch", brandId: "abcde", brandDescTitle: "Unexpected Beauty", brandDesc: "A peasant blouse and a swishy skirt - in crisp cotton transformed with a spray of lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do asadsj ld pja sdfkj lasd kajsdf kas lka skads fjasdk ksdfj oqr asdf e. Elaskjfx ksdfj asdf w wer sd df wew sadf jaksdfj lasdjf kasdjf qeoh askjsaf akdjsf. Elaskjfx ksdfj asdf w wer sd df wew sadf jaksdfj lasdjf kasdjf qeoh askjsaf akdjsf.", logo: pic2, poster: pic, productIds: ["359131344"])
        let uniqlo = Brand(brandName: "UNIQLO USA", brandId: "edcba", brandDescTitle: "POV Jeans", brandDesc: "A peasant blouse and a swishy skirt - in crisp cotton transformed with a spray of lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do asadsj ld pja sdfkj lasd kajsdf kas lka skads fjasdk ksdfj oqr asdf e. Elaskjfx ksdfj asdf w wer sd df wew sadf jaksdfj lasdjf kasdjf qeoh askjsaf akdjsf. Elaskjfx ksdfj asdf w wer sd df wew sadf jaksdfj lasdjf kasdjf qeoh askjsaf akdjsf.", logo: pic, poster: pic2, productIds: ["359131344","359131344","359131344","359131344"])
        
        brands = [Brand]()
        
        super.init()
        
        self.addBrand(tory)
        self.addBrand(uniqlo)
    }
    
    func addBrand(brand: Brand) -> Brand {
        self.brands.append(brand)
        return brand
    }
    
    func getCount() -> Int {
        return self.brands.count
    }
    
    func getBrandAtIndex(index: Int) -> Brand? {
        return brands[index]
    }
    
}
