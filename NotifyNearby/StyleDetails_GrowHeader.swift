//
//  StyleDetails_GrowHeader.swift
//  NotifyNearby
//
//  Created by Curtis Li on 4/8/16.
//  Copyright © 2016 Curtis Li. All rights reserved.
//

import UIKit
import IOStickyHeader

class StyleDetails_GrowHeader: UICollectionViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var constraintBgHeight : NSLayoutConstraint!
    var brand: Brand?
    
    // Initialization code
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // IOStickyHeader attributes
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        guard let layoutAttributes:IOStickyHeaderFlowLayoutAttributes = layoutAttributes as? IOStickyHeaderFlowLayoutAttributes else { return }
        
        if layoutAttributes.progressiveness < 1 {
            self.constraintBgHeight.constant = GlobalFunctions.heightOfscaledUIImage(self.backgroundImage.image!, withWidth: UIScreen.mainScreen().bounds.size.width)
            self.backgroundImage.updateConstraintsIfNeeded()
        } else {
            self.constraintBgHeight.constant = GlobalFunctions.heightOfscaledUIImage(self.backgroundImage.image!, withWidth: UIScreen.mainScreen().bounds.size.width) * layoutAttributes.progressiveness
            self.backgroundImage.updateConstraintsIfNeeded()
        }
    }
    
    // Initialize with brand
    func initWithBrand(brand: Brand) {
        // Save the brand object locally
        self.brand = brand
        
        // Set the Xib properties
        self.backgroundImage.image = GlobalFunctions.scaleUIImageToSize(brand.posterImage!, width: UIScreen.mainScreen().bounds.size.width)
    }
}
