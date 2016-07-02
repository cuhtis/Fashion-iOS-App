//
//  StyleDetails_ViewController.swift
//  NotifyNearby
//
//  Created by Curtis Li on 4/6/16.
//  Copyright © 2016 Curtis Li. All rights reserved.
//

import UIKit
import IOStickyHeader

class StyleDetails_ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, StyleDetailsCollectionViewCellDelegate {

    @IBOutlet weak var collectionView : UICollectionView!
    
    let headerNib = UINib(nibName: "StyleDetails_GrowHeader", bundle: NSBundle.mainBundle())
    let cellNib = UINib(nibName: "StyleDetails_Cell", bundle: NSBundle.mainBundle())
    var brand : Brand?
    
    // Initialization
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupCollectionView()
    }
    
    // Initialize Collection View
    func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        // IOStickyHeaderFlowLayout settings
        if let layout: IOStickyHeaderFlowLayout = self.collectionView.collectionViewLayout as? IOStickyHeaderFlowLayout {
            layout.parallaxHeaderReferenceSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, GlobalFunctions.heightOfscaledUIImage(self.brand!.posterImage!, withWidth: UIScreen.mainScreen().bounds.size.width))
            layout.parallaxHeaderMinimumReferenceSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, 0)
            layout.itemSize = CGSizeMake(UIScreen.mainScreen().bounds.size.width, GlobalFunctions.heightOfscaledUIImage(self.brand!.posterImage!, withWidth: UIScreen.mainScreen().bounds.size.width))
            layout.parallaxHeaderAlwaysOnTop = true
            layout.disableStickyHeaders = true
            self.collectionView.collectionViewLayout = layout
        }
        
        self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        
        // Register Xibs
        self.collectionView.registerNib(self.headerNib, forSupplementaryViewOfKind: IOStickyHeaderParallaxHeader, withReuseIdentifier: "styleDetailsHeader")
        self.collectionView.registerNib(self.cellNib, forCellWithReuseIdentifier: "styleDetailsCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource & UICollectionViewDelegate
    
    // Single section
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Single item
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: StyleDetails_Cell = collectionView.dequeueReusableCellWithReuseIdentifier("styleDetailsCell", forIndexPath: indexPath) as! StyleDetails_Cell
        
        // Create cell
        cell.delegate = self
        cell.initWithBrand(self.brand!)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(UIScreen.mainScreen().bounds.size.width, 555);
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind {
        case IOStickyHeaderParallaxHeader:
            let cell = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "styleDetailsHeader", forIndexPath: indexPath) as! StyleDetails_GrowHeader
            cell.initWithBrand(self.brand!)
            return cell
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    // MARK: Navigation
    
    func gotoSeeMorePage(brand: Brand) {
        self.brand = brand
        performSegueWithIdentifier("seeMore", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "seeMore" {
            let dest: SeeMore_ViewController = segue.destinationViewController as! SeeMore_ViewController
            dest.brand = self.brand!
        }
    }
    
    @IBAction func unwindToStyleDetails(segue: UIStoryboardSegue) {
        
    }
}
