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
        self.navigationBar.tintColor = UIColor.blackColor()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
