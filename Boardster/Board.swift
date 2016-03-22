//
//  Board.swift
//  Boardster
//
//  Created by Casey McCourt on 2/9/16.
//  Copyright © 2016 McCourt Industries. All rights reserved.
//

import UIKit

class Board: NSObject, NSCoding {
    // MARK: Properties
    
    var name: String
    var model: String
    var totalName: String
    var photo: UIImage?
    var rating: Int
    var length: String?
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("boards")
    
    // MARK: Types
    
    struct PropertyKey {
        static let nameKey = "name"
        static let modelKey = "model"
        static let totalNameKey = "totalName"
        static let photoKey = "photo"
        static let ratingKey = "rating"
        static let lengthKey = "length"
    }
    
    // MARK: Initialization
    
    init?(name: String, model: String, totalName: String, photo: UIImage?, rating: Int, length: String?) {
        // Initialize stored properties.
        self.name = name
        self.model = model
        self.totalName = totalName
        self.photo = photo
        self.rating = rating
        self.length = length
        
        super.init()
        
        // Initialization should fail if there is no name, model, or if the rating is negative.
        if name.isEmpty || model.isEmpty || rating < 0 {
            return nil
        }
    }
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(model, forKey: PropertyKey.modelKey)
        aCoder.encodeObject(totalName, forKey: PropertyKey.totalNameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
        aCoder.encodeObject(length, forKey: PropertyKey.lengthKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let model = aDecoder.decodeObjectForKey(PropertyKey.modelKey) as! String
        let totalName = aDecoder.decodeObjectForKey(PropertyKey.totalNameKey) as! String
        
        // Because photo is an optional property of Board, use conditional cast.
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        let length = aDecoder.decodeObjectForKey(PropertyKey.lengthKey) as? String
        
        // Must call designated initializer.
        self.init(name: name, model: model, totalName: totalName, photo: photo, rating: rating, length: length)
    }
    
}