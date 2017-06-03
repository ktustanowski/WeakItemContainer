# WeakItemContainer
![Build status](https://travis-ci.org/ktustanowski/WeakItemContainer.svg?branch=master)

Generic container for holding weak references to objects. Written in Swift 3.0.
#Why to use
* Weak items storage
* Automatically removes items right after they are deallocated💥
* Build on top of *NSHashTable*
* Strongly typed

#When to use
When you have to store: 
* Unordered
* Unique item

list of objects but you don't want them to be retained. [Multicast delegate pattern](http://blog.scottlogic.com/2012/11/19/a-multicast-delegate-pattern-for-ios-controls.html) - when you have to maintain lists of delegates and, heavens forbid, you don't want them to be retained - is one of the examples. 
# Installation
### Carthage
```
github "ktustanowski/WeakItemContainer" == 0.1.1
```
