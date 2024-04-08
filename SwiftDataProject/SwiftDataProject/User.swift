//
//  User.swift
//  SwiftDataProject
//
//  Created by Robert Bates on 4/3/24.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String = "Default Name"
    var city: String = "Default City"
    var joinDate: Date = Date.now
    @Relationship(deleteRule: .cascade) var jobs: [Job]? = [Job]()
    
    var unwrappedJobs: [Job] {
        jobs ?? [] 
    }

    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
