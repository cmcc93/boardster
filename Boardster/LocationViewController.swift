//
//  LocationViewController.swift
//  Boardster
//
//  Created by Casey McCourt on 2/5/16.
//  Copyright © 2016 McCourt Industries. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBAction func sanFranciscoToSnowboardsTable(sender: UIButton) {
        performSegueWithIdentifier("sanFranciscoToSnowboardsTableSegue", sender: nil)
    }
    
    @IBAction func losAngelesToSnowboardsTable(sender: UIButton) {
        performSegueWithIdentifier("sanFranciscoToSnowboardsTableSegue", sender: nil)
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
