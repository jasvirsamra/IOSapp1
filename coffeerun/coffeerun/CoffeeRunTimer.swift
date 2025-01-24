//
//  CoffeeRunTimer.swift
//  coffeerun
//
//  Created by Jasvir on 2025-01-24.
//

import SwiftUI

struct CoffeeRunTimer: View {
    @State private var timeRemaining = 300
    @State private var isRunning = false

    var body: some View {
        VStack {
            Text("Time Remaining: \(timeRemaining) seconds")
                .font(.headline)
                .padding()

            HStack {
                Button("Start Timer") {
                    isRunning = true
                }
                Button("Reset Timer") {
                    timeRemaining = 300
                    isRunning = false
                }
            }
            .padding()
        }
        .onChange(of: isRunning) { _ in
            if isRunning {
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                    if timeRemaining > 0 {
                        timeRemaining -= 1
                    } else {
                        timer.invalidate()
                        isRunning = false
                    }
                }
            }
        }
    }
}

