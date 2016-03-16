//
//  BoardViewControllerTableVersionNonAdmin.swift
//  Boardster
//
//  Created by Casey McCourt on 3/15/16.
//  Copyright © 2016 McCourt Industries. All rights reserved.
//

import UIKit

class BoardViewControllerTableVersionNonAdmin: BoardViewControllerTableVersion {
    
    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var lengthTextField: UITextField!
    
    @IBOutlet weak var storedPhotoImageView: UIImageView!
    @IBOutlet weak var storedRatingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let board = board {
            nameLabel.text = board.name
            storedPhotoImageView.image = board.photo
            storedRatingControl.rating = board.rating
            lengthTextField.text = board.length
        }
        
    }
    
    override func checkValidBoardName() {
        
    }

}
