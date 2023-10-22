//
//  main.swift
//  test16
//
//  Created by Robert Bates on 9/19/23.
//

import Foundation

func randomArray(_ numbers: [Int]?) -> Int {
    return numbers?.randomElement() ?? Int.random(in: 1..<100)
}

var test: [Int]? = nil
print(randomArray(test))
test = []
print(randomArray(test))
test = [101, 102, 103]
print(randomArray(test))
