//
//  Items.swift
//  ShopList
//
//  Created by Rustam Gradov on 22/05/2019.
//  Copyright © 2019 Rustam Gradov. All rights reserved.
//

import Foundation
import UIKit
import CoreData

@objc(Items)
class Items: NSManagedObject {
    
    @NSManaged var itemTitle: String
    @NSManaged var count: Int
    @NSManaged var date: Date
    
    convenience init(itemTitle: String, count: Int) {
        
        self.init(context: CoreDataHelper.shared.container.viewContext)
        
        self.itemTitle = itemTitle
        self.count = count
        self.date = Date()
    }
}

