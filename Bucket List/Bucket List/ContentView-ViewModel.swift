//
//  ContentView-ViewModel.swift
//  Bucket List
//
//  Created by Robert Bates on 5/16/24.
//

import Foundation
import MapKit

extension ContentView {
    @Observable
    class ViewModel {
        var locations = [Location]()
        var selectedPlace: Location?
    }
}
