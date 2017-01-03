//
//  HighScore+CoreDataProperties.swift
//  KnowYourAngles
//
//  Created by iPad App Dev on 1/3/17.
//  Copyright © 2017 Iolani School. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension HighScore {

    @NSManaged var numCorrect: NSNumber?
    @NSManaged var timeLimitMin: NSNumber?
    @NSManaged var timeLimitSec: NSNumber?
    @NSManaged var timeTakenMin: NSNumber?
    @NSManaged var timeTakenSec: NSNumber?
    @NSManaged var totalProblems: NSNumber?
    @NSManaged var category: String?
    @NSManaged var table: Table?

}
