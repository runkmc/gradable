//
//  GradebookViewModel.swift
//  Gradable
//
//  Created by Kevin McGladdery on 3/19/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import CoreData

class GradebookViewModel {
    let title: String
    let notes: String
    
    init(gradebook:Gradebook) {
        self.title = gradebook.title
        self.notes = gradebook.notes
    }
}
