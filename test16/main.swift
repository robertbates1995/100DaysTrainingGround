//
//  main.swift
//  test16
//
//  Created by Robert Bates on 9/19/23.
//

import Foundation

protocol building {
    var rooms: Int { get set }
    var cost: Int { get set }
    var agent: String { get set }
    func summary()
}

struct House: building {
    var rooms: Int
    var cost: Int
    var agent: String
    func summary() {
        print("This house has \(rooms) rooms. It costs $\(cost), and is sold by \(agent)")
    }
}

struct Office: building {
    var rooms: Int
    var cost: Int
    var agent: String
    func summary() {
        print("This office has \(rooms) rooms. It costs $\(cost), and is sold by \(agent)")
    }
}

let house = House(rooms: 6, cost: 4700000, agent: "test agent")
let office = Office(rooms: 600, cost: 74000000, agent: "test agent 2")

house.summary()
office.summary()
