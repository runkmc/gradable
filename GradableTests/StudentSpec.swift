//
//  StudentSpec.swift
//  Gradable
//
//  Created by Kevin McGladdery on 2/23/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import CoreData
import Quick
import Nimble
@testable import Gradable

class StudentSpec: QuickSpec {
    static let moc = setupCoreData(NSInMemoryStoreType)
    
    override func spec() {
        describe("a Student") {
            let room = NSEntityDescription.insertNewObjectForEntityForName("Gradebook", inManagedObjectContext: StudentSpec.moc) as! Gradebook
            room.setValue("MUS1001", forKey: "title")
            room.setValue("Music 1345, TTh 9 - 9:50", forKey: "notes")
            let student = NSEntityDescription.insertNewObjectForEntityForName("Student", inManagedObjectContext: StudentSpec.moc) as! Student
            student.setValue("Benjamin", forKey: "firstName")
            student.setValue("Sisko", forKey: "lastName")
            student.setValue(room, forKey: "gradebook")
            
            it("has properties") {
                expect(student.firstName) == "Benjamin"
                expect(student.lastName) == "Sisko"
                expect(student.gradebook) == room
            }
        }
    }
}