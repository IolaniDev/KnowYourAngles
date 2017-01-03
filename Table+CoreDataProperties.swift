//
//  Table+CoreDataProperties.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 12/24/16.
//  Copyright © 2016 Iolani School. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Table {

    @NSManaged var category: String?
    @NSManaged var highScores: NSOrderedSet?
    @NSManaged var user: NSManagedObject?

}
