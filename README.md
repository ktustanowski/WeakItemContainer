# WeakItemContainer
Generic container, written in Swift, for holding weak references to objects. 
#Why to use
This container auto-maintains its items and automatically removes them right after they are deallocated by the system.
#When to use
When you have to hold (unordered!) list of objects but you don't want this objects to be retained. [Multicast delegate pattern](http://blog.scottlogic.com/2012/11/19/a-multicast-delegate-pattern-for-ios-controls.html) - when you have to maintain lists of delegates and, heavens forbid, you don't want them to be retained - is one of the examples. 
# Containing Objective-C world inside
This Container is build on top of NSHashTable and relies on its faboulous automatically-remove-item-when-nilled feature to maintain object list. Althought build with Objective-C class Weak Item Container contains Objective-C uncertainty inside and uses generic approach available in swift.
#Unit tests
Included and available to run locally.
