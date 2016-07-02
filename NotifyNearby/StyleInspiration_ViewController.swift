//
//  ViewController.swift
//  NotifyNearby
//
//  Created by Curtis Li on 4/6/16.
//  Copyright © 2016 Curtis Li. All rights reserved.
//

import UIKit

class StyleInspiration_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, BrandTableViewCellDelegate {

    @IBOutlet weak var tableView : UITableView!
    let tableCellNib = UINib(nibName: "Brand_TableViewCell", bundle: NSBundle.mainBundle())
    let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    var brand: Brand?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setupTableView()
    }
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.registerNib(self.tableCellNib, forCellReuseIdentifier: "cell")
        
        self.tableView.estimatedRowHeight = 500.0;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITableViewDataSource & UITableViewDelegate
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int)->Int
    {
        return appDelegate.brands.getCount()
    }
    
    func numberOfSectionsInTableView(tableView:UITableView)->Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! Brand_TableViewCell
        
        let brand : Brand = appDelegate.brands.getBrandAtIndex(indexPath.item)!
        
        cell.delegate = self
        cell.initWithBrand(brand)
        
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    // MARK: Navigation
    
    func gotoDetailsPage(brand: Brand) {
        self.brand = brand
        performSegueWithIdentifier("details", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "details" {
            let dest: StyleDetails_ViewController = segue.destinationViewController as! StyleDetails_ViewController
            dest.brand = self.brand!
        }
    }
    
    @IBAction func unwindToStyleInspiration(segue: UIStoryboardSegue) {
        
    }
}

