//
//  Brand_TableViewCell.swift
//  NotifyNearby
//
//  Created by Curtis Li on 4/6/16.
//  Copyright © 2016 Curtis Li. All rights reserved.
//

import UIKit

protocol BrandTableViewCellDelegate: class {
    func gotoDetailsPage(brand : Brand)
}

class Brand_TableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView : UIImageView!
    @IBOutlet weak var logoButton : UIButton!
    @IBOutlet weak var brandNameButton : UIButton!
    @IBOutlet weak var likeButton : UIButton!
    @IBOutlet weak var descTitle : UILabel!
    @IBOutlet weak var descText : UILabel!
    
    var brand : Brand?
    var height : CGFloat = 0
    var delegate : BrandTableViewCellDelegate?
    
    let likedImage: UIImage = UIImage(named: "heartFull")!
    let notLikedImage: UIImage = UIImage(named: "heart")!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initWithBrand(brand : Brand) {
        // Save reference to brand
        self.brand = brand
        
        // Update visuals
        self.update()
    }
    
    func getHeight() -> CGFloat {
        return self.height
    }
    
    func update() {
        // Set the images and text
        self.posterImageView.image = GlobalFunctions.scaleUIImageToSize(self.brand!.posterImage!, width: UIScreen.mainScreen().bounds.size.width)
        let logoImage: UIImage = GlobalFunctions.scaleUIImageToSize(self.brand!.logoImage!, size: CGSize(width: 100, height: 100))
        self.logoButton.setImage(logoImage, forState: .Normal)
        self.brandNameButton.setTitle(self.brand!.brandName, forState: .Normal)
        self.descTitle.text = self.brand!.brandDescTitle
        self.descText.text = self.brand!.brandDesc
        self.height = self.posterImageView.image!.size.height
        
        // Set "heart" image depending on liked status
        if brand!.liked {
            self.likeButton.setImage(likedImage, forState: .Normal)
        } else {
            self.likeButton.setImage(notLikedImage, forState: .Normal)
        }
    }
    
    @IBAction func pressLikeButton() {
        self.brand!.liked = !self.brand!.liked
        self.update()
    }
    
    @IBAction func pressBrand() {
        self.delegate!.gotoDetailsPage(self.brand!)
    }
}
