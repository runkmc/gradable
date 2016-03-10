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
            let room = NSEntityDescription.insertNewObjectForEntityForName("Gradebook", inManagedObjectContext: AssignmentSpec.moc) as! Gradebook
            room.setValue("MUS1001", forKey: "title")
            room.setValue("Music 1345, TTh 9 - 9:50", forKey: "notes")
            let aType = NSEntityDescription.insertNewObjectForEntityForName("AssignmentType", inManagedObjectContext: AssignmentSpec.moc) as! AssignmentType
            aType.name = "Quiz"
            aType.percentage = 20
            aType.gradebook = room
            try! AssignmentTypeSpec.moc.save()
            
            it("has properties") {
                expect(aType.name) == "Quiz"
                expect(aType.percentage) == 20
                expect(aType.gradebook) == room
            }
            
        }
    }
}