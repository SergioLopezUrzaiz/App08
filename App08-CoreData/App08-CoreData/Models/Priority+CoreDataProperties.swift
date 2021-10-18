//
//  Priority+CoreDataProperties.swift
//  App08-CoreData
//
//  Created by Alumno on 18/10/21.
//
//

import Foundation
import CoreData


extension Priority {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Priority> {
        return NSFetchRequest<Priority>(entityName: "Priority")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var image: String?
    @NSManaged public var priority: String?
    @NSManaged public var priority_id: String?
    
    var priority_id_wrapped: String {
        priority_id ?? ""
    }
    
    var priority_wrapped: String {
        priority ?? ""
    }
    
    var image_wrapped: String {
        image ?? ""
    }

}

extension Priority : Identifiable {

}
