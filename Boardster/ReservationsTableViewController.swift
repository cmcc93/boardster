//
//  ReservationsTableViewController.swift
//  Boardster
//
//  Created by Casey McCourt on 1/22/16.
//  Copyright © 2016 McCourt Industries. All rights reserved.
//

import UIKit

class ReservationsTableViewController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barbuttonFont = UIFont(name: "Ubuntu-Light", size: 17) ?? UIFont.systemFontOfSize(17)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: barbuttonFont], forState: UIControlState.Normal)
        //        stackoverflow.com/a/26871348
//        to change font color, add:
//            NSForegroundColorAttributeName:UIColor.whiteColor()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = Selector("revealToggle:")
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

    }
    

    
}
