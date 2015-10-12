//
//  WeakItemContainerTests.swift
//  PlayPlex
//
//  Created by Kamil Tustanowski on 07.10.2015.
//  Copyright © 2015 Viacom. All rights reserved.
//

import XCTest
import Nimble
@testable import WeakItemContainer

class WeakItemContainerTests: XCTestCase {
    
    var container: WeakItemContainer<NSObject>!
    
    override func setUp() {
        super.setUp()
        self.container = WeakItemContainer<NSObject>()
    }
    
    func testIfCanAppendItem() {
        let object = NSObject()
        
        container.append(object)
        
        guard let objectFromContainer = container.weakItemsTable.allObjects.last else {
            fail()
            return
        }
        
        expect(objectFromContainer) === object
    }
    
    func testIfCantHaveDuplicatedObjects() {
        let object = NSObject()
        container.append(object)
        container.append(object)
        
        expect(self.container.weakItemsTable.count).to(equal(1))
    }
    
    func testIfCanRemoveItem() {
        let object = NSObject()
        container.append(object)
        
        container.remove(object)
        
        expect(self.container.weakItemsTable.count).to(equal(0))
    }
    
    func testIfCanRemoveAllObjectsAtOnce() {
        let objects = testObjectsArray()
        for object in objects {
            container.append(object)
        }
        
        container.removeAll()
        
        expect(self.container.weakItemsTable.count).to(equal(0))
    }
    
    func testIfCanRetrieveObjects() {
        let objectOne = NSObject()
        let objectTwo = NSObject()
        
        container.append(objectOne)
        container.append(objectTwo)
        
        let objects = container.items()
        
        expect(objects.count).to(equal(2))
    }
    
    func testIfObjectsAddedToContainerCanBeDeallocated() {
        var object:NSObject? = NSObject()
        container.append(object!)
        
        object = nil
        
        let objects = container.items()
        
        expect(objects.count).to(equal(0))
    }
    
    func testIfCanSeeObjectCount() {
        let objects = testObjectsArray()
        for object in objects {
            container.append(object)
        }

        expect(self.container.count()).to(equal(objects.count))
    }
    
}

// MARK: Helper methods
extension WeakItemContainerTests {
    
    func testObjectsArray() -> [NSObject] {
        return [NSObject(), NSObject(), NSObject(), NSObject(), NSObject(), NSObject(), NSObject(), NSObject(), NSObject(), NSObject()]
    }
    
}
