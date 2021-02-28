//
//  TypeTransaction+CoreDataProperties.swift
//  CATATAN KEUANGAN
//
//  Created by IndratS on 28/02/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//
//

import Foundation
import CoreData


extension TypeTransaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TypeTransaction> {
        return NSFetchRequest<TypeTransaction>(entityName: "TypeTransaction")
    }

    @NSManaged public var name: String?
    @NSManaged public var is_default: Bool
    @NSManaged public var status: Int64

}
