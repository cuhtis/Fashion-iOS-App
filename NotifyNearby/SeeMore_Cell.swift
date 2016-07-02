//
//  IOCell.swift
//  NotifyNearby
//
//  Created by Curtis Li on 4/7/16.
//  Copyright © 2016 Curtis Li. All rights reserved.
//

import UIKit

class SeeMore_Cell: UICollectionViewCell {
    
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var desc : UILabel!
    var brand : Brand?
    
    // Initialization code
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Initialize with brand
    func initWithBrand(brand : Brand) {
        // Save brand locally
        self.brand = brand
        
        // Set Xib properties
        self.title.text = brand.brandDescTitle
        self.desc.text = brand.brandDesc
    }
    
}
