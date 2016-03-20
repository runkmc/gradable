//
//  StudentViewModel.swift
//  Gradable
//
//  Created by Kevin McGladdery on 3/19/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import CoreData

class StudentViewModel {
    let firstName: String
    let lastName: String
    let studentID: String?
    var compositeName: String {
        return "\(self.lastName), \(self.firstName)"
    }
    
    init(student:Student) {
        self.firstName = student.firstName
        self.lastName = student.lastName
        self.studentID = student.studentID
    }
}