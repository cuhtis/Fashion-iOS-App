//
//  SeeMore_ViewController.swift
//  NotifyNearby
//
//  Created by Curtis Li on 4/6/16.
//  Copyright © 2016 Curtis Li. All rights reserved.
//

import UIKit
import IOStickyHeader

class SeeMore_ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout   {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let headerNib = UINib(nibName: "SeeMore_GrowHeader", bundle: NSBundle.mainBundle())
    let cellNib = UINib(nibName: "SeeMore_Cell", bundle: NSBundle.mainBundle())
    var brand : Brand?
    
    // Initialization code
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
    }

    // Initialize Collection View
    func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        // IOStickyHeaderFlowLayout
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
        self.collectionView.registerNib(self.headerNib, forSupplementaryViewOfKind: IOStickyHeaderParallaxHeader, withReuseIdentifier: "seeMoreHeader")
        self.collectionView.registerNib(self.cellNib, forCellWithReuseIdentifier: "seeMoreCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UICollectionViewDataSource & UICollectionViewDelegate
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    // Get "cell"
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: SeeMore_Cell = collectionView.dequeueReusableCellWithReuseIdentifier("seeMoreCell", forIndexPath: indexPath) as! SeeMore_Cell
        
        // Init cell
        cell.initWithBrand(self.brand!)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(UIScreen.mainScreen().bounds.size.width, 500);
    }
    
    // Get "header"
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind {
        case IOStickyHeaderParallaxHeader:
            let cell = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "seeMoreHeader", forIndexPath: indexPath) as! SeeMore_GrowHeader
            cell.initWithBrand(self.brand!)
            return cell
        default:
            assert(false, "Unexpected element kind")
        }
    }

}
