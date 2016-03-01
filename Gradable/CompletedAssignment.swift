//
//  CompletedAssignment.swift
//  Gradable
//
//  Created by Kevin McGladdery on 2/29/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import CoreData

final class CompletedAssignment: NSManagedObject {
    @NSManaged var assignment: Assignment
    @NSManaged var student: Student
}