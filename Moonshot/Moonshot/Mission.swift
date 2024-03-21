//
//  Mission.swift
//  Moonshot
//
//  Created by Robert Bates on 2/17/24.
//

import Foundation

struct Mission: Codable, Identifiable, Hashable {
    static func == (lhs: Mission, rhs: Mission) -> Bool {
        return (lhs.id == rhs.id)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(launchDate)
        hasher.combine(description)
    }
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo\(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
