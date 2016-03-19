//
//  GradebookViewModelSpec.swift
//  Gradable
//
//  Created by Kevin McGladdery on 3/17/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import CoreData
import Quick
import Nimble
@testable import Gradable

class GradebookViewModelSpec: QuickSpec {
    static let moc = setupCoreData(NSInMemoryStoreType)
    
    override func spec() {
        describe("a Gradebook") {
            let objects = setupViewModelTestData(GradebookViewModelSpec.moc)
            let book = GradebookViewModel(gradebook: objects["gradebook"] as! Gradebook)
            
            it("has properties") {
                expect(book.title) == "MUS1001"
                expect(book.notes) == "Music 1345, TTh 9 - 9:50"
            }
        }
        
    }
    
}