//
//  User+CoreDataProperties.swift
//  duren
//
//  Created by Budi Sugiarto on 01/04/19.
//  Copyright © 2019 Baskoro Nugroho. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var password: String?

}
