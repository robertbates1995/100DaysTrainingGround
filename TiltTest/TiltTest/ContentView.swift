//
//  ContentView.swift
//  TiltTest
//
//  Created by Robert Bates on 2/25/24.
//

import CoreMotion
import SwiftUI

class MotionManager: ObservableObject {
    private let motionManager = CMMotionManager()
    @Published var x = 0.0
    @Published var y = 0.0
    
    init() {
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, error in
            guard let motion = data?.attitude else { return }
            self?.x = motion.roll
            self?.y = motion.pitch
        }
    }
}

struct ContentView: View {
    @StateObject private var motion = MotionManager()
    
    var body: some View {
        VStack {
            Image(systemName: "arrow.down.message.fill")
                .foregroundStyle(
                    .blue.gradient.shadow(
                        .inner(
                            color: .black,
                            radius: 5,
                            x: motion.x * -20,
                            y: motion.y * -20
                        )
                    )
                )
                .font(.system(size: 200).bold())
                .rotation3DEffect(.degrees(motion.x * 20), axis: (x: 0, y: 1, z: 0))
                .rotation3DEffect(.degrees(motion.y * 20), axis: (x: -1, y: 0, z: 0))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
