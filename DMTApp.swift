//
//  Disaster_Management_TrackerApp.swift
//  Disaster Management Tracker
//
//  Created by Neema Tabarani on 2/24/25.
//

import SwiftUI
import UIKit

@main
struct MyApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false // Read dark mode preference

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(isDarkMode ? .dark : .light) // Apply color scheme
        }
    }
}