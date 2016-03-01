//
//  Assignment.swift
//  Gradable
//
//  Created by Kevin McGladdery on 2/27/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import CoreData

final class Assignment: NSManagedObject {
    @NSManaged var assignedDate: NSDate?
    @NSManaged var dueDate: NSDate?
    @NSManaged var name: String
    @NSManaged var assignmentType: AssignmentType
    @NSManaged var completedAssignments: CompletedAssignments
}
