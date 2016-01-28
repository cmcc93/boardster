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
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = Selector("revealToggle:")
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    
}
