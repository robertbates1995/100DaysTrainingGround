//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Robert Bates on 3/22/24.
//

import SwiftUI

struct CheckoutView: View {
    @Bindable var order: Order
    
    var body: some View {
        Text("hello world")
    }
}

#Preview {
    CheckoutView(order: Order())
}
