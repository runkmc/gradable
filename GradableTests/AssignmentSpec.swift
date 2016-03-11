//
//  AssignmentSpec.swift
//  Gradable
//
//  Created by Kevin McGladdery on 3/10/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import CoreData
import Nimble
import Quick
@testable import Gradable

class AssignmentSpec: QuickSpec {
    static let moc = setupCoreData(NSInMemoryStoreType)
    
    override func spec() {
        describe("An assignment type") {
            let book = NSEntityDescription.insertNewObjectForEntityForName("Gradebook", inManagedObjectContext: AssignmentSpec.moc) as! Gradebook
            book.setValue("MUS1001", forKey: "title")
            book.setValue("Music 1345, TTh 9 - 9:50", forKey: "notes")
            let aType = NSEntityDescription.insertNewObjectForEntityForName("AssignmentType", inManagedObjectContext: AssignmentSpec.moc) as! AssignmentType
            aType.name = "Quiz"
            aType.percentage = 20
            aType.gradebook = book
            let rightNow = NSDate()
            let assignment = NSEntityDescription.insertNewObjectForEntityForName("Assignment", inManagedObjectContext: AssignmentSpec.moc) as! Assignment
            assignment.assignedDate = rightNow
            assignment.dueDate = rightNow
            assignment.name = "First Quiz"
            assignment.assignmentType = aType
            
            it("has properties") {
                expect(assignment.assignedDate!) == rightNow
                expect(assignment.dueDate!) == rightNow
                expect(assignment.name) == "First Quiz"
                expect(assignment.assignmentType) == aType
            }
            
        }
    }
}