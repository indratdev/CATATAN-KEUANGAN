//
//  CategoryTransaction+CoreDataProperties.swift
//  CATATAN KEUANGAN
//
//  Created by IndratS on 28/02/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//
//

import Foundation
import CoreData


extension CategoryTransaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryTransaction> {
        return NSFetchRequest<CategoryTransaction>(entityName: "CategoryTransaction")
    }

    @NSManaged public var type: String?
    @NSManaged public var name: String?
    @NSManaged public var status: Int64

}
