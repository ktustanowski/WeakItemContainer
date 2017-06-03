//
//  WeakItemContainerTests.swift
//  PlayPlex
//
//  Created by Kamil Tustanowski on 07.10.2015.
//  Copyright © 2015 Viacom. All rights reserved.
//

import XCTest
@testable import WeakItemContainer

class WeakItemContainerTests: XCTestCase {
    
    var container: WeakItemContainer<NSObject>!
    
    override func setUp() {
        super.setUp()
        container = WeakItemContainer<NSObject>()
    }
    
    override func tearDown() {
        container.removeAll()
        container = nil
        super.tearDown()
    }
    
    func testIfCanAppendItem() {
        let object = NSObject()
        
        container.append(object)
        
        XCTAssert(self.container.count == 1)
    }
    
    func testIfCantHaveDuplicatedObjects() {
        let object = NSObject()
        container.append(object)
        container.append(object)
        
        XCTAssert(self.container.count == 1)
    }
    
    func testIfCanRemoveItem() {
        let object = NSObject()
        container.append(object)
        
        container.remove(object)
        
        XCTAssert(self.container.count == 0)
    }
    
    func testIfWhenTryingToRemoveUncontainedItemDoesNothing() {
        XCTAssertNoThrow({ [weak self] in self?.container.remove(NSObject()) })
    }
    
    func testIfCanRemoveAllObjectsAtOnce() {
        let objects = testObjectsArray()
        for object in objects {
            container.append(object)
        }

        container.removeAll()
        
        XCTAssert(self.container.count == 0)
    }
    
    func testIfCanRetrieveObjects() {
        let objectOne = NSObject()
        let objectTwo = NSObject()
        
        container.append(objectOne)
        container.append(objectTwo)
        
        let items = container.items
        
        XCTAssert(items.count == 2)
        XCTAssert(items.contains(objectOne) == true)
        XCTAssert(items.contains(objectTwo) == true)
    }
    
    func testIfObjectsAddedToContainerCanBeDeallocated() {
        var object:NSObject? = NSObject()
        container.append(object!)
        
        object = nil
        
        XCTAssert(self.container.count == 0)
    }
    
    func testIfCanSeeObjectCount() {
        let objects = testObjectsArray()
        for object in objects {
            container.append(object)
        }
        
        XCTAssert(self.container.count == objects.count)
    }    
}

// MARK: Helper methods
extension WeakItemContainerTests {
    
    func testObjectsArray() -> [NSObject] {
        return [NSObject(), NSObject(), NSObject(), NSObject(), NSObject(), NSObject(), NSObject(), NSObject(), NSObject(), NSObject()]
    }
    
}
