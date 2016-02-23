//
//  setupCoreData.swift
//  Gradable
//
//  Created by Kevin McGladdery on 2/22/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import CoreData

func setupCoreData(storeType:String) -> NSManagedObjectContext {
    let bundles = [NSBundle(forClass: Classroom.self)]
    guard let mom = NSManagedObjectModel.mergedModelFromBundles(bundles) else {
        fatalError("no managed object model")
    }
    let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
    let options: Dictionary<String, Bool> = [NSMigratePersistentStoresAutomaticallyOption: true,
        NSInferMappingModelAutomaticallyOption: true]
    switch storeType {
    case NSSQLiteStoreType:
        let documents = try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        let store = documents.URLByAppendingPathComponent("Gradable.Gradebook")
        try! psc.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: store, options: options)
    case NSInMemoryStoreType:
        try! psc.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: options)
    default: fatalError("Tried to use a nonapproved PersistentStoreType. This kills the app.")
    }
    
    let context = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
    context.persistentStoreCoordinator = psc
    return context
}