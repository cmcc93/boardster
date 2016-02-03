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
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]
//        self.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
//        self.navigationBar.barStyle = UIBarStyle.Black
        self.navigationBar.tintColor = UIColor.blackColor()
//
//        self.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.translucent = true

        // Do any additional setup after loading the view.
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
