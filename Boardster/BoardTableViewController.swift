//
//  BoardTableViewController.swift
//  Boardster
//
//  Created by Casey McCourt on 2/2/16.
//  Copyright © 2016 McCourt Industries. All rights reserved.
//

import UIKit

class BoardTableViewController: UITableViewController {

    // MARK: Properties
        
    var boards = [Board]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // Use the edit button item provided by the table view controller.
//        navigationItem.leftBarButtonItem = editButtonItem()
        editButtonItem().tintColor = UIColor.blackColor()
        
        // Load any saved boards, otherwise load sample data.
        if let savedBoards = loadBoards() {
            boards += savedBoards
        } else {
            // Load the sample data.
            loadSampleBoards()
        }
    }
        
    func loadSampleBoards() {
        let photo1 = UIImage(named: "board1")!
        let board1 = Board(name: "Caprese Salad", photo: photo1, rating: 4, length: "76")!
        
        let photo2 = UIImage(named: "board2")!
        let board2 = Board(name: "Chicken and Potatoes", photo: photo2, rating: 5, length: "42")!
        
        let photo3 = UIImage(named: "board3")!
        let board3 = Board(name: "Pasta with Meatballs", photo: photo3, rating: 3, length: "93")!
        
        boards += [board1, board2, board3]
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boards.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "BoardTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! BoardTableViewCell
        
        // Fetches the appropriate board for the data source layout.
        let board = boards[indexPath.row]
        
        cell.nameLabel.text = board.name
        cell.photoImageView.image = board.photo
        cell.ratingControl.rating = board.rating
        cell.lengthLabel.text = board.length
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            boards.removeAtIndex(indexPath.row)
            saveBoards()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
        
        
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            let boardDetailViewController = segue.destinationViewController as! BoardViewControllerTableVersion
            
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
    
    
    @IBAction func unwindToBoardList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? BoardViewControllerTableVersion, board = sourceViewController.board {
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
    
    // MARK: NSCoding
    
    func saveBoards() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(boards, toFile: Board.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save boards...")
        }
    }
    
    func loadBoards() -> [Board]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Board.ArchiveURL.path!) as? [Board]
    }
}
