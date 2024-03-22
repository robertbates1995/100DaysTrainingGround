//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Robert Bates on 3/21/24.
//

import SwiftUI
import CoreHaptics

class ContentModel {
    var counter: Int = 0
    var engine: CHHapticEngine?
}

struct ContentView: View {
    @State var model = ContentModel()
    
    var body: some View {
        Spacer()
        Button("growing intensity, growing sharpness", action: growingIntensityAndSharpness)
            .onAppear(perform: prepareHaptics)
        Spacer()
        Button("growing intensity, shrinking sharpness", action: growingIntensityShrinkingSharpness)
        Spacer()
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            model.engine = try CHHapticEngine()
            try model.engine?.start()
        } catch {
            print("there was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    
    func growingIntensityAndSharpness() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        for i in stride(from: 0, through: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try model.engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
    
    func growingIntensityShrinkingSharpness() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        for i in stride(from: 0, through: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try model.engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
}

#Preview {
    ContentView()
}
