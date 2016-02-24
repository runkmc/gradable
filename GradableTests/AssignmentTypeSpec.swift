//
//  AssignmentTypeSpec.swift
//  Gradable
//
//  Created by Kevin McGladdery on 2/24/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import CoreData
import Quick
import Nimble
@testable import Gradable

class AssignmentTypeSpec: QuickSpec {
    static let moc = setupCoreData(NSInMemoryStoreType)
    
    override func spec() {
        describe("an AssignmentType") {
            let room = NSEntityDescription.insertNewObjectForEntityForName("Classroom", inManagedObjectContext: AssignmentTypeSpec.moc) as! Classroom
            room.setValue("MUS1001", forKey: "title")
            room.setValue("Music 1345, TTh 9 - 9:50", forKey: "notes")
            let atype = NSEntityDescription.insertNewObjectForEntityForName("AssignmentType", inManagedObjectContext: AssignmentTypeSpec.moc) as! AssignmentType
            atype.setValue("Quizzes", forKey:"name")
            atype.setValue(30, forKey: "percentage")
            atype.setValue(room, forKey: "classroom")
            
            it("has properties") {
                expect(atype.name) == "Quizzes"
                expect(atype.percentage) == 30
                expect(atype.classroom) == room
            }
        }
    }
    
}