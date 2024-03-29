//
//  Order.swift
//  CupcakeCorner
//
//  Created by Robert Bates on 3/22/24.
//

import Foundation

@Observable
class Order: Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 6
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    var extraFrosting = false
    var addSprinkles = false
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var hasValidAddress: Bool {
        if isBlank(string: name) || isBlank(string: streetAddress) || isBlank(string: city) || isBlank(string: zip) {
            return false
        }
        return true
    }
    
    var cost: Double {
        var cost = Double(quantity * 2)
        
        cost += Double(type / 2)
        
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if addSprinkles {
            cost += Double(quantity / 2)
        }
        
        return cost
    }
    
    func isBlank(string: String) -> Bool {
        return string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
