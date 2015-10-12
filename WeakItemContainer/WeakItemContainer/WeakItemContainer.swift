//
//  WeakItemContainer.swift
//
//  Copyright © 2015 Kamil Tustanowski. All rights reserved.
//

import Foundation

/* 
 * <Element: AnyObject> results in compile time error when passed protocols
 * (@protocol Name : class is not a solution) thats why I do the casting.
 * It could be done more swiftly without the NSHashTable but its remove-when-reference-is-nil functionality is amazing!
 * Contain Objective-C world inside and I'm not letting it out.
 */
class WeakItemContainer<Element> {
    
    var weakItemsTable = NSHashTable.weakObjectsHashTable()
    
    func append(element: Element) {
        guard let item = element as? AnyObject else {
            assertionFailure("Not AnyObject passed to WeakItemContainer.append!")
            return
        }
        weakItemsTable.addObject(item)
    }
    
    func remove(element: Element) {
        guard let item = element as? AnyObject else {
            assertionFailure("Not AnyObject passed to WeakItemContainer.remove!")
            return
        }
        
        weakItemsTable.removeObject(item)
    }
    
    func removeAll() {
        weakItemsTable.removeAllObjects()
    }
    
    func items() -> [Element] {
        return castedItems()
    }
    
    func count() -> Int {
        return items().count
    }
    
    func castedItems() -> [Element] {
        var castedItems = [Element]()
        
        for item in weakItemsTable.allObjects {
            if let castedItem = item as? Element {
                castedItems.append(castedItem)
            }
        }
        
        return castedItems
    }
}
