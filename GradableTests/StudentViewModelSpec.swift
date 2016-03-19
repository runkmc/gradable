//
//  StudentViewModelSpec.swift
//  Gradable
//
//  Created by Kevin McGladdery on 3/19/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import CoreData
import Quick
import Nimble
@testable import Gradable

class StudentViewModelSpec: QuickSpec {
    static let moc = setupCoreData(NSInMemoryStoreType)
    
    override func spec() {
        describe("a Student") {
            let objects = setupViewModelTestData(StudentViewModelSpec.moc)
            let student = StudentViewModel(student:objects["student"] as! Student)
            
        }
    }
}
