//: Playground - noun: a place where people can play

import Foundation
import WeakItemContainer


let container = WeakItemContainer<String>()

let helloWorld = "HelloWorld"

container.append(helloWorld)

print(container.count)
print(container.items)

