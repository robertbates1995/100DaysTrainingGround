//
//  ContentView.swift
//  Bucket List
//
//  Created by Robert Bates on 5/14/24.
//

import SwiftUI

struct ContentView: View {
    @State private var loadingState = LoadingState.loading
    
    enum LoadingState {
        case loading, success, failed
    }
    
    struct LoadingView: View {
        var body: some View {
            Text("Loading...")
        }
    }

    struct SuccessView: View {
        var body: some View {
            Text("Success!")
        }
    }

    struct FailedView: View {
        var body: some View {
            Text("Failed.")
        }
    }
    
    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
    }
}

struct User: Identifiable, Comparable {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.firstName
    }
}

#Preview {
    ContentView()
}
