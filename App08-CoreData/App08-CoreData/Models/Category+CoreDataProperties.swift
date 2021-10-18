//
//  Category+CoreDataProperties.swift
//  App08-CoreData
//
//  Created by Alumno on 18/10/21.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var category: String?
    @NSManaged public var category_id: String?
    @NSManaged public var id: UUID?
    @NSManaged public var image: String?
    
    var category_id_wrapped: String {
        category_id ?? ""
    }
    
    var category_wrapped: String {
        category ?? ""
    }
    
    var image_wrapped: String {
        image ?? ""
    }

}

extension Category : Identifiable {

}
