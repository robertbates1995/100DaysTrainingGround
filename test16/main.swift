//
//  main.swift
//  test16
//
//  Created by Robert Bates on 9/19/23.
//

import Foundation

class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Dog")
    }
    init() {
        super.init(legs: 4)
    }
}

class Cat: Animal {
    var isTame: Bool
    func speak() {
        print("Cat")
    }
    init(isTame: Bool) {
        self.isTame = isTame
        super.init(legs: 4)
    }
}

final class Corgi: Dog {
    override func speak() {
        print("Corgi")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("Poodle")
    }
}

final class Persian: Cat {
    override func speak() {
        print("Persian")
    }
    init() {
        super.init(isTame: true)
    }
}

final class Lion: Cat {
    override func speak() {
        print("Lion")
    }
    init() {
        super.init(isTame: false)
    }
}

let dog = Dog()
let corgi = Corgi()
let poodle = Poodle()

let cat = Cat(isTame: true)
let persian = Persian()
let lion = Lion()

dog.speak()
corgi.speak()
poodle.speak()
cat.speak()
persian.speak()
lion.speak()
