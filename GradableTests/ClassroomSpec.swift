//
//  ClassroomSpec.swift
//  Gradable
//
//  Created by Kevin McGladdery on 2/21/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import CoreData
import Quick
import Nimble
@testable import Gradable

class ClassroomSpec: QuickSpec {
    static let moc = setupCoreData(NSInMemoryStoreType)
    
    override func spec() {
        describe("a Classroom") {
            let room = NSEntityDescription.insertNewObjectForEntityForName("Classroom", inManagedObjectContext: ClassroomSpec.moc) as! Classroom
            room.setValue("MUS1001", forKey: "title")
            room.setValue("Music 1345, TTh 9 - 9:50", forKey: "notes")
            try! ClassroomSpec.moc.save()
            
            it("has properties") {
                print(room.notes)
                expect(room.title) == "MUS1001"
                expect(room.notes) == "Music 1345, TTh 9 - 9:50"
            }
        }
    }
}