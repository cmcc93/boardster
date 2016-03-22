//
//  ModesNavigationController.swift
//  Boardster
//
//  Created by Casey McCourt on 1/31/16.
//  Copyright © 2016 McCourt Industries. All rights reserved.
//

import UIKit

class ModesNavigationController: UINavigationController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationBar.barStyle = UIBarStyle.Black
        self.navigationBar.translucent = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
