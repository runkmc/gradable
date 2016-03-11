//
//  CompletedAssignmentSpec.swift
//  Gradable
//
//  Created by Kevin McGladdery on 3/11/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import CoreData
import Nimble
import Quick
@testable import Gradable

class CompletedAssignmentSpec: QuickSpec {
    static let moc = setupCoreData(NSInMemoryStoreType)
    
    override func spec() {
        describe("a Completed Assignment") {
            let book = NSEntityDescription.insertNewObjectForEntityForName("Gradebook", inManagedObjectContext: CompletedAssignmentSpec.moc) as! Gradebook
            book.setValue("MUS1001", forKey: "title")
            book.setValue("Music 1345, TTh 9 - 9:50", forKey: "notes")
            let aType = NSEntityDescription.insertNewObjectForEntityForName("AssignmentType", inManagedObjectContext: CompletedAssignmentSpec.moc) as! AssignmentType
            aType.name = "Quiz"
            aType.percentage = 20
            aType.gradebook = book
            let student = NSEntityDescription.insertNewObjectForEntityForName("Student", inManagedObjectContext: CompletedAssignmentSpec.moc) as! Student
            student.setValue("Benjamin", forKey: "firstName")
            student.setValue("Sisko", forKey: "lastName")
            student.setValue(book, forKey: "gradebook")
            let rightNow = NSDate()
            let assignment = NSEntityDescription.insertNewObjectForEntityForName("Assignment", inManagedObjectContext: CompletedAssignmentSpec.moc) as! Assignment
            assignment.assignedDate = rightNow
            assignment.dueDate = rightNow
            assignment.name = "First Quiz"
            assignment.assignmentType = aType
            let quiz = NSEntityDescription.insertNewObjectForEntityForName("CompletedAssignment", inManagedObjectContext: CompletedAssignmentSpec.moc) as! CompletedAssignment
            quiz.student = student
            quiz.assignment = assignment
            
            it("has properties") {
                expect(quiz.student) == student
                expect(quiz.assignment) == assignment
            }
        }
    }
}
