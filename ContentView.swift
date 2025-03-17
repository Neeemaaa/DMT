//
//  ContentView.swift
//  Disaster Management Tracker
//
//  Created by Neema Tabarani on 2/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TabView {
                TrackView()
                    .tabItem {
                        Label("Track", systemImage: "location")
                    }
                
                MapView()
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }
                
                ShelterView()
                    .tabItem {
                        Label("Shelter", systemImage: "house")
                    }
                
                DonateView()
                    .tabItem {
                        Label("Donate", systemImage: "heart")
                    }
                
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
            }
            VStack {
                HStack {
                    Spacer()
                    MenuButton()
                        .padding()
                }
                Spacer()
            }
        }
    }
}

struct TrackView: View {
    var body: some View {
        Text("Active Disasters")
    }
}

struct MapView: View {
    var body: some View {
        Text("Google Maps")
    }
}

struct ShelterView: View {
    var body: some View {
        Text("Offer Shelter/AirBnb")
    }
}

struct DonateView: View {
    var body: some View {
        Text("Donation Page")
    }
}

struct SearchView: View {
    var body: some View {
        Text("Search for Disaster")
    }
}

struct MenuButton: View {
    @State private var showMenu = false
    @State private var navigationDestination: NavigationDestination?

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    showMenu.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3")
                    .foregroundColor(.gray)
                    .padding()
            }
            
            if showMenu {
                VStack {
                    Button("Settings") {
                        navigationDestination = .settings
                        showMenu = false
                    }
                    .padding()
                    
                    Button("Help") {
                        navigationDestination = .help
                        showMenu = false
                    }
                    .padding()
                    
                    Button("About") {
                        navigationDestination = .about
                        showMenu = false
                    }
                    .padding()
                }
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 10)
                .transition(.move(edge: .top).combined(with: .opacity))
                .padding()
            }
        }
        .background(
            NavigationLink(
                destination: navigationDestination?.view,
                isActive: Binding(
                    get: { navigationDestination != nil },
                    set: { if !$0 { navigationDestination = nil } }
                )
            ) { EmptyView() }
        )
    }
}

enum NavigationDestination {
    case settings, help, about

    @ViewBuilder
    var view: some View {
        switch self {
        case .settings:
            SettingsView()
        case .help:
            HelpView()
        case .about:
            AboutView()
        }
    }
}

#Preview {
    ContentView()
}
