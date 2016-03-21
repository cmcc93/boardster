//
//  BoardTableViewControllerNonAdmin.swift
//  Boardster
//
//  Created by Casey McCourt on 3/8/16.
//  Copyright © 2016 McCourt Industries. All rights reserved.
//

import UIKit

class BoardTableViewControllerNonAdmin: BoardTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetailNonAdmin" {
            let boardDetailViewController = segue.destinationViewController as! BoardViewControllerTableVersionNonAdmin
            
            // Get the cell that generated this segue.
            if let selectedBoardCell = sender as? BoardTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedBoardCell)!
                let selectedBoard = boards[indexPath.row]
                boardDetailViewController.board = selectedBoard
            }
        }
        else if segue.identifier == "AddItem" {
            print("Adding new board.")
        }
    }
    
    
    @IBAction override func unwindToBoardList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? BoardViewControllerTableVersionNonAdmin, board = sourceViewController.board {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing board.
                boards[selectedIndexPath.row] = board
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            } else {
                // Add a new board.
                let newIndexPath = NSIndexPath(forRow: boards.count, inSection: 0)
                boards.append(board)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            // Save the boards.
            saveBoards()
        }
    }

}
