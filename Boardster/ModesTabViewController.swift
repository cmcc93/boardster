//
//  ModesTabViewController.swift
//  Boardster
//
//  Created by Casey McCourt on 1/27/16.
//  Copyright © 2016 McCourt Industries. All rights reserved.
//

import UIKit

class ModesTabViewController: UIViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
//    @IBAction func snowHomeToTable(sender: UIButton) {
//        performSegueWithIdentifier("snowboardsHomeToBoardsTable", sender: nil)
//    }
    
    @IBAction func surfHomeToTable(sender: UIButton) {
        performSegueWithIdentifier("surfboardsHomeToBoardsTable", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = Selector("revealToggle:")
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        // Do any additional setup after loading the view.
    }
    
}
