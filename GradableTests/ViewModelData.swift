//
//  ViewModelData.swift
//  Gradable
//
//  Created by Kevin McGladdery on 3/19/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import CoreData
@testable import Gradable

func setupViewModelTestData(moc:NSManagedObjectContext) -> [String:NSManagedObject] {
    let book = NSEntityDescription.insertNewObjectForEntityForName("Gradebook", inManagedObjectContext: moc) as! Gradebook
    book.setValue("MUS1001", forKey: "title")
    book.setValue("Music 1345, TTh 9 - 9:50", forKey: "notes")
    
    let student = NSEntityDescription.insertNewObjectForEntityForName("Student", inManagedObjectContext: moc) as! Student
    student.setValue("Benjamin", forKey: "firstName")
    student.setValue("Sisko", forKey: "lastName")
    student.setValue("DS9", forKey:"studentID")
    student.setValue(book, forKey: "gradebook")
    
    let aType = NSEntityDescription.insertNewObjectForEntityForName("AssignmentType", inManagedObjectContext: moc) as! AssignmentType
    aType.name = "Quiz"
    aType.percentage = 20
    aType.gradebook = book
    
    let rightNow = NSDate()
    let assignment = NSEntityDescription.insertNewObjectForEntityForName("Assignment", inManagedObjectContext: moc) as! Assignment
    assignment.assignedDate = rightNow
    assignment.dueDate = rightNow
    assignment.name = "First Quiz"
    assignment.assignmentType = aType
    
    let quiz = NSEntityDescription.insertNewObjectForEntityForName("CompletedAssignment", inManagedObjectContext: moc) as! CompletedAssignment
    quiz.student = student
    quiz.assignment = assignment
    
    return ["gradebook":book, "student":student, "assignmentType":aType, "assignment":assignment, "completedAssignment":quiz]
}
