//
//  Table.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 12/23/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//

import Foundation
import CoreData


class Table: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context);
    }
    override var description: String{
        return category! + " \(highScores!.count)";
    }
}
