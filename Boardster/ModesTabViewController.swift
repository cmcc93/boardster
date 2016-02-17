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
    
    @IBAction func homeToBoardsSegue(sender: UIButton) {
        dispatch_async(dispatch_get_main_queue()) {
            [unowned self] in
            self.performSegueWithIdentifier("snowboardsToLabel", sender: self)
        }
    }

//    @IBAction func surfHometoSurfTableSegue(sender: UIButton) {
//        self.performSegueWithIdentifier("surfboardsToLabel", sender: nil)
//    }
    
    @IBAction func segue(sender: AnyObject) {
        self.performSegueWithIdentifier("surfboardsToLabel", sender: nil)
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
