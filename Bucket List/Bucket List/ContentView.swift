//
//  ContentView.swift
//  Bucket List
//
//  Created by Robert Bates on 5/14/24.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var isUnlocked = false
    
    var body: some View {
        
        VStack{
            if isUnlocked {
                Text("unlocked")
            } else {
                Text("locked")
            }
        }
        .padding()
        .background(isUnlocked ? Color(.green) : Color(.red))
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to authenticate using biometrics to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    isUnlocked = true
                    //authenticated successfully
                } else {
                    //there was a problem
                }
            }
        } else {
            //no biometrics available
        }
    }
}

#Preview {
    ContentView()
}
