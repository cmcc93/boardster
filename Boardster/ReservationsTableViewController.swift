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
        
//        let navbarFont = UIFont(name: "Ubuntu", size: 17) ?? UIFont.systemFontOfSize(17)
        let barbuttonFont = UIFont(name: "Ubuntu-Light", size: 15) ?? UIFont.systemFontOfSize(15)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: barbuttonFont, NSForegroundColorAttributeName:UIColor.whiteColor()], forState: UIControlState.Normal)
//        stackoverflow.com/a/26871348
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = Selector("revealToggle:")
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

    }
    

    
}
