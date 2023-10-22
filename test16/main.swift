//
//  main.swift
//  test16
//
//  Created by Robert Bates on 9/19/23.
//

import Foundation

var num: Int?

func printNumber(_ number: Int?) {
    if let number = num {
        print("the integer is: \(number)")
    } else {
        print("this value has not been set")
    }
}

printNumber(num)
num = 3
printNumber(num)
