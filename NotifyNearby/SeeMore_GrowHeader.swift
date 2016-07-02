//
//  IOGrowHeader.swift
//  NotifyNearby
//
//  Created by Curtis Li on 4/7/16.
//  Copyright © 2016 Curtis Li. All rights reserved.
//

import UIKit
import IOStickyHeader

class SeeMore_GrowHeader: UICollectionViewCell {
    
    @IBOutlet weak var brandName : UILabel!
    @IBOutlet weak var logoImage : UIImageView!
    @IBOutlet weak var backgroundImage : UIImageView!
    @IBOutlet weak var constraintBgHeight : NSLayoutConstraint!
    var overlay : UIView?
    var brand : Brand?
    
    // Initialization code
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Create black overlay for background image
        self.overlay = UIView(frame: CGRect(x: 0, y: 0, width: backgroundImage.image!.size.width, height: backgroundImage.image!.size.height))
        self.overlay!.backgroundColor = UIColor(white: 0, alpha: 0.7)
        backgroundImage.addSubview(self.overlay!)
    }

    // IOStickyHeader attributes
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        guard let layoutAttributes:IOStickyHeaderFlowLayoutAttributes = layoutAttributes as? IOStickyHeaderFlowLayoutAttributes else { return }
        
        if layoutAttributes.progressiveness < 1 {
            self.constraintBgHeight.constant = self.backgroundImage.image!.size.height
            self.backgroundImage.updateConstraintsIfNeeded()
            self.logoImage.updateConstraintsIfNeeded()
        } else {
            self.constraintBgHeight.constant = self.backgroundImage.image!.size.height * layoutAttributes.progressiveness
            self.backgroundImage.updateConstraintsIfNeeded()
            self.logoImage.updateConstraintsIfNeeded()
        }
    }
    
    // Initialize with brand
    func initWithBrand(brand : Brand) {
        // Save the brand object locally
        self.brand = brand
        
        self.brandName.text = brand.brandName
        self.logoImage.image = brand.logoImage
        self.backgroundImage.image = GlobalFunctions.scaleUIImageToSize(brand.posterImage!, width: UIScreen.mainScreen().bounds.size.width)
        self.constraintBgHeight.constant = self.backgroundImage.image!.size.height
    }
}
