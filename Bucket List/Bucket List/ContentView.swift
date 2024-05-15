//
//  ContentView.swift
//  Bucket List
//
//  Created by Robert Bates on 5/14/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition)
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        print("Tapped at \(coordinate)")
                    }
                }
        }
    }
}

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}

#Preview {
    ContentView()
}
