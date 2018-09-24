//
//  Dates+CoreDataProperties.swift
//  TestsOnDates
//
//  Created by SeoGiwon on 24/09/2018.
//  Copyright © 2018 SeoGiwon. All rights reserved.
//
//

import Foundation
import CoreData


extension Dates {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dates> {
        return NSFetchRequest<Dates>(entityName: "Dates")
    }

    @NSManaged public var date: String?

}
