//
//  CoreDataHelper.swift
//  ShopList
//
//  Created by Rustam Gradov on 24/05/2019.
//  Copyright © 2019 Rustam Gradov. All rights reserved.
//

import Foundation
import CoreData

class CoreDataHelper {
    
    let container: NSPersistentContainer
    let model: NSManagedObjectModel
    
    static let shared = CoreDataHelper()
    
    private init() {
        
        let modelURL = Bundle.main.url(forResource: "Model", withExtension: "momd")!
        self.model = NSManagedObjectModel(contentsOf: modelURL)!
        self.container = NSPersistentContainer(name: "Shop", managedObjectModel: model)
        
        self.container.loadPersistentStores { (description, error) in
            if let error = error {
                print(error)
            }
        }
        self.container.viewContext.automaticallyMergesChangesFromParent = true
    }
}



