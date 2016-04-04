//
//  SnowboardLocationViewController.swift
//  Boardster
//
//  Created by Casey McCourt on 2/2/16.
//  Copyright © 2016 McCourt Industries. All rights reserved.
//

import UIKit

class SnowboardLocationViewController: UIViewController {
    
    @IBAction func sanfranToTable(sender: UIButton) {
        performSegueWithIdentifier("locationsToTable", sender: nil)
    }
    
//    @IBAction func losangToTable(sender: UIButton) {
//        performSegueWithIdentifier("locationsToTable", sender: nil)
//    }
    
    @IBAction func losangToTable(sender: AnyObject) {
        performSegueWithIdentifier("locationsToTable", sender: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        var destination = segue.destinationViewController as? UITableViewController
//        
//        if let navCon = destination as? ModesNavigationController {
//            destination = navCon.topViewController
//        }
//    }
    
}
