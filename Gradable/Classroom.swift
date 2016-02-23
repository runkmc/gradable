//
//  Classroom.swift
//  Gradable
//
//  Created by Kevin McGladdery on 2/20/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import CoreData

final class Classroom: NSManagedObject {
    @NSManaged var title: String
    @NSManaged var notes: String
    @NSManaged var students: NSSet
}
