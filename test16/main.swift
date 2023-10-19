//
//  main.swift
//  test16
//
//  Created by Robert Bates on 9/19/23.
//

import Foundation

enum ShiftDirection {
    case up
    case down
}

struct Car {
    var model: String
    var seats: Int
    private var gear: Int
    
    init(model: String, seats: Int) {
        self.model = model
        self.seats = seats
        self.gear = 0
    }
    
    mutating func shift(_ direction: ShiftDirection) {
        if direction == ShiftDirection.up {
            if gear > 5 {
                print("\(model) cannot shift up. Currently in highest gear.")
            } else {
                gear += 1
                print("\(model) shifted to gear: \(gear)")
            }
        }
        if direction == ShiftDirection.down {
            if gear < 1 {
                print("\(model) cannot shift down. Currently in lowest gear.")
            } else {
                gear -= 1
                print("\(model) shifted to gear: \(gear)")
            }
        }
    }
}

var car = Car(model: "test car", seats: 4)
for _ in 0...6 {
    car.shift(.up)
}
for _ in 0...6 {
    car.shift(.down)
}

var car2 = Car(model: "test car 2", seats: 4)
for _ in 0...6 {
    car2.shift(.up)
}
for _ in 0...6 {
    car2.shift(.down)
}
