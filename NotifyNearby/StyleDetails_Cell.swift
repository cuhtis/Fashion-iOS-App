//
//  StyleDetails_Cell.swift
//  NotifyNearby
//
//  Created by Curtis Li on 4/8/16.
//  Copyright © 2016 Curtis Li. All rights reserved.
//

import UIKit

protocol StyleDetailsCollectionViewCellDelegate: class {
    func gotoSeeMorePage(brand : Brand)
}

class StyleDetails_Cell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var descTitle: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var seeMoreButton: UIButton!
    @IBOutlet weak var addFavoritesButton: UIButton!
    @IBOutlet weak var productsView: UICollectionView!
    @IBOutlet weak var productsFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var showAllProductsButton: UIButton!
    
    let productNib = UINib(nibName: "Product_Cell", bundle: NSBundle.mainBundle())

    var brand: Brand?
    var delegate: StyleDetailsCollectionViewCellDelegate?
    
    // Initialization code
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Initialize with brand
    func initWithBrand(brand: Brand) {
        // Save the brand object locally
        self.brand = brand
        
        // Set the Xib properties
        self.brandName.text = brand.brandName
        self.descTitle.text = brand.brandDescTitle
        self.desc.text = brand.brandDesc
        
        
        // White background, orange border/text for show all button
        showAllProductsButton.backgroundColor = UIColor.whiteColor()
        showAllProductsButton.layer.cornerRadius = 5
        showAllProductsButton.layer.borderWidth = 1
        showAllProductsButton.layer.borderColor = UIColor.orangeColor().CGColor
        
        // Update the favourites button
        updateFavoritesButton()
        
        self.productsView.registerNib(self.productNib, forCellWithReuseIdentifier: "productCell")
        
        self.productsView.dataSource = self
        self.productsView.delegate = self
    }
    
    // MARK: Products CollectionView
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(self.brand!.products.getCount())
        return self.brand!.products.getCount();
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: Product_Cell = collectionView.dequeueReusableCellWithReuseIdentifier("productCell", forIndexPath: indexPath) as! Product_Cell
        
        cell.initWithProduct(self.brand!.products.getProductAtIndex(indexPath.item)!)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(200, 250);
    }
    
    // MARK: Navigation
    
    // Segue to See More page
    @IBAction func gotoSeeMore() {
        self.delegate!.gotoSeeMorePage(self.brand!)
    }
    
    // Segue to See More page
    @IBAction func gotoSeeAllProducts() {
    }
    
    // MARK: Helper Functions
    
    // Toggle "liked" status
    @IBAction func pressAddFavoritesButton() {
        self.brand!.liked = !self.brand!.liked
        updateFavoritesButton()
    }
    
    // Update the favourites button
    func updateFavoritesButton() {
        if self.brand!.liked {
            brandLiked()
        } else {
            brandNotLiked()
        }
    }
    
    func brandNotLiked() {
        // White background, orange border/text
        addFavoritesButton.backgroundColor = UIColor.whiteColor()
        addFavoritesButton.layer.cornerRadius = 5
        addFavoritesButton.layer.borderWidth = 1
        addFavoritesButton.layer.borderColor = UIColor.orangeColor().CGColor
        addFavoritesButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        addFavoritesButton.setTitle("Add to Favorites", forState: .Normal)
    }
    
    func brandLiked() {
        // Orange background, white border/text
        addFavoritesButton.backgroundColor = UIColor.orangeColor()
        addFavoritesButton.layer.cornerRadius = 5
        addFavoritesButton.layer.borderWidth = 1
        addFavoritesButton.layer.borderColor = UIColor.whiteColor().CGColor
        addFavoritesButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        addFavoritesButton.setTitle("Favorited", forState: .Normal)
    }
}
