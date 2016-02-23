//
//  Student.swift
//  Gradable
//
//  Created by Kevin McGladdery on 2/23/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import CoreData

final class Student: NSManagedObject {
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var classroom: Classroom
}