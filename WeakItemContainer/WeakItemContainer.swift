/* The MIT License (MIT)
 *
 * Copyright (c) 2015 Kamil Tustanowski (ktustanowski)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

import Foundation

/*
 * <Element: AnyObject> results in compile time error when passed protocols
 * (@protocol Name : class is not a solution) thats why I do the casting.
 * It could be done more swiftly without the NSHashTable but its remove-when-reference-is-nil functionality is amazing!
 * Contain Objective-C world inside and not letting it out.
 */
public struct WeakItemContainer<Element> {
    
    private var weakItemsTable = NSHashTable<AnyObject>.weakObjects()
    
    public init() { }
    
    public func append(_ element: Element) {
        guard let item = element as? AnyObject else {
            assertionFailure("Not AnyObject passed to append!")
            return
        }
        
        weakItemsTable.add(item)
    }
    
    public func remove(_ element: Element) {
        guard let item = element as? AnyObject else {
            assertionFailure("Not AnyObject passed to remove!")
            return
        }
        
        weakItemsTable.remove(item)
    }
    
    public func removeAll() {
        weakItemsTable.removeAllObjects()
    }
    
    public var count: Int {
        return items.count
        
    }

    public var items: [Element] {
        return weakItemsTable.allObjects.flatMap { $0 as? Element }
    }
}
