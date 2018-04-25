# WeakItemContainer
[![Build Status](https://travis-ci.org/ktustanowski/WeakItemContainer.svg?branch=master)](https://travis-ci.org/ktustanowski/WeakItemContainer)
![Carthage compatibile](https://camo.githubusercontent.com/3dc8a44a2c3f7ccd5418008d1295aae48466c141/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f43617274686167652d636f6d70617469626c652d3442433531442e7376673f7374796c653d666c6174)

Generic container for holding weak references to objects. Written in Swift 3.0.
# Why to use
* Weak items storage
* Automatically removes items right after they are deallocated💥
* Build on top of *NSHashTable*
* Strongly typed

# When to use
When you have to store: 
* Unordered
* Unique item

list of objects but you don't want them to be retained. [Multicast delegate pattern](http://blog.scottlogic.com/2012/11/19/a-multicast-delegate-pattern-for-ios-controls.html) - when you have to maintain lists of delegates and, heavens forbid, you don't want them to be retained - is one of the examples. 
# Installation
### Carthage
```
github "ktustanowski/WeakItemContainer" == 0.5
```
