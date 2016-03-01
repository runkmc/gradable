//
//  AssignmentType.swift
//  Gradable
//
//  Created by Kevin McGladdery on 2/24/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import CoreData

class AssignmentType: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var percentage: NSNumber
    @NSManaged var gradebook: Gradebook
    @NSManaged var assignments: NSSet
}