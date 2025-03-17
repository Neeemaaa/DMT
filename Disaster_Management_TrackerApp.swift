//
//  Disaster_Management_TrackerApp.swift
//  Disaster Management Tracker
//
//  Created by Neema Tabarani on 2/24/25.
//

import SwiftUI
import UIKit // Replaced AppKit with UIKit

@main
struct MyApp: App {
    @State private var isSettingsPresented = false // State to control sheet presentation

    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                // Removed SettingsView from here
            }
            .sheet(isPresented: $isSettingsPresented) {
                SettingsView() // Present SettingsView as a sheet
            }
        }
        .commands {
            CommandGroup(replacing: .appSettings) {
                Button("Settings") {
                    isSettingsPresented = true // Trigger sheet presentation
                }
            }
        }
    }
}
