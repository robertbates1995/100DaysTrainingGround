//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Robert Bates on 3/21/24.
//

import SwiftUI

@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
        case _place = "place"
    }
    
    var name = "Taylor"
    var place = "Nashville"
}

struct ContentView: View {
    
    var body: some View {
        Button("Encode", action: encodeTaylor)
    }
    
    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    ContentView()
}
