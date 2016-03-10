//
//  BoardViewControllerNonAdmin.swift
//  Boardster
//
//  Created by Casey McCourt on 3/9/16.
//  Copyright © 2016 McCourt Industries. All rights reserved.
//

import UIKit

class BoardViewControllerNonAdmin: BoardViewController {

    // MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        nameTextField.delegate = self
        
        // Set up views if editing an existing Board.
        if let board = board {
            nameLabel.text = board.name
        }
        
    }

    override func checkValidBoardName() {
        
    }

}
