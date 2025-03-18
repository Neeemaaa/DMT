//
//  ContentView.swift
//  Disaster Management Tracker
//
//  Created by Neema Tabarani on 2/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    // Move everything else down
                    Spacer().frame(height: 50) // Add space at the top
                    
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
                        
                        SocialMediaView()
                            .tabItem {
                                Label("Updates", systemImage: "bubble.left.and.bubble.right")
                            }
                    }
                }
                
                VStack {
                    HStack {
                        Spacer()
                        MenuButton()
                            .padding(.top, 20) // Move the menu button up
                            .padding(.trailing, 16) // Add some padding to the right
                    }
                    Spacer()
                }
            }
        }
    }
}

struct TrackView: View {
    @State private var searchText = ""
    @State private var isSearchActive = false // Tracks whether the search bar is active
    @State private var disasters: [Disaster] = [
        Disaster(name: "Hurricane Ian", location: "Florida", distance: 50, description: "A powerful hurricane that caused significant damage in Florida."),
        Disaster(name: "California Wildfires", location: "California", distance: 200, description: "Severe wildfires affecting large areas of California."),
        Disaster(name: "Flooding in Texas", location: "Texas", distance: 100, description: "Heavy rainfall caused widespread flooding in Texas."),
        Disaster(name: "Earthquake in Japan", location: "Japan", distance: 5000, description: "A major earthquake that struck Japan."),
        Disaster(name: "Tornado in Oklahoma", location: "Oklahoma", distance: 300, description: "A destructive tornado that hit Oklahoma.")
    ]
    
    var body: some View {
        VStack {
            // Animated Search Bar
            HStack {
                if isSearchActive {
                    TextField("Search for disasters...", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .transition(.move(edge: .trailing).combined(with: .opacity)) // Slide and fade animation
                        .animation(.snappy, value: isSearchActive)
                }
                
                Button(action: {
                    withAnimation {
                        isSearchActive.toggle() // Toggle the search bar visibility
                    }
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding()
                        .frame(width: 44, height: 44)
                        .background(Circle().fill(Color.white).shadow(radius: 5))
                }
                .frame(maxWidth: isSearchActive ? 44 : .infinity, alignment: isSearchActive ? .trailing : .center) // Center or align right
                .animation(.easeInOut, value: isSearchActive)
            }
            .padding()
            
            // Top 3 Closest Disasters
            Text("Top 3 Closest Disasters")
                .font(.headline)
                .padding(.top)
            
            List {
                ForEach(closestDisasters) { disaster in
                    NavigationLink(destination: DisasterDetailView(disaster: disaster)) {
                        VStack(alignment: .leading) {
                            Text(disaster.name)
                                .font(.headline)
                            Text("\(disaster.location) - \(disaster.distance) miles away")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            
            // Search Results
            if !searchText.isEmpty {
                Text("Search Results")
                    .font(.headline)
                    .padding(.top)
                
                List {
                    ForEach(searchResults) { disaster in
                        NavigationLink(destination: DisasterDetailView(disaster: disaster)) {
                            VStack(alignment: .leading) {
                                Text(disaster.name)
                                    .font(.headline)
                                Text(disaster.location)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
    
    // Filtered disasters based on search text
    private var searchResults: [Disaster] {
        disasters.filter { disaster in
            disaster.name.localizedCaseInsensitiveContains(searchText) ||
            disaster.location.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    // Top 3 closest disasters
    private var closestDisasters: [Disaster] {
        disasters.sorted { $0.distance < $1.distance }.prefix(3).map { $0 }
    }
}

// Disaster model
struct Disaster: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let distance: Int
    let description: String
}

struct MapView: View {
    var body: some View {
        Text("Google Maps")
    }
}

struct ShelterView: View {
    let shelters = [
        Shelter(name: "Airbnb.org", description: "Offer shelter to those in need during disasters.", address: "123 Main St, San Francisco, CA"),
        Shelter(name: "Habitat for Humanity", description: "Help build homes for disaster survivors.", address: "456 Elm St, Los Angeles, CA"),
        Shelter(name: "ShelterBox", description: "Provide emergency shelter and tools for families.", address: "789 Oak St, Austin, TX")
    ]
    
    var body: some View {
        NavigationView {
            List(shelters) { shelter in
                NavigationLink(destination: ShelterDetailView(shelter: shelter)) {
                    VStack(alignment: .leading) {
                        Text(shelter.name)
                            .font(.headline)
                        Text(shelter.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Shelters")
        }
    }
}

struct DonateView: View {
    let organizations = [
        Organization(name: "Red Cross", description: "Help provide disaster relief and recovery.", donationLink: "https://www.redcross.org"),
        Organization(name: "UNICEF", description: "Support children affected by disasters worldwide.", donationLink: "https://www.unicef.org"),
        Organization(name: "World Food Programme", description: "Provide food assistance to disaster-stricken areas.", donationLink: "https://www.wfp.org")
    ]
    
    var body: some View {
        NavigationView {
            List(organizations) { organization in
                NavigationLink(destination: DonationDetailView(organization: organization)) {
                    VStack(alignment: .leading) {
                        Text(organization.name)
                            .font(.headline)
                        Text(organization.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Donate")
        }
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
        ZStack(alignment: .topTrailing) { // Keep the menu in the top-right corner
            // Detect taps outside the menu to close it
            if showMenu {
                Color.black.opacity(0.001) // Transparent background to detect taps
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            showMenu = false
                        }
                    }
            }
            
            VStack(alignment: .trailing) {
                // Menu Button
                Button(action: {
                    withAnimation {
                        showMenu.toggle()
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(.gray)
                        .padding()
                        .background(Circle().fill(Color.white).shadow(radius: 5))
                }
                
                // Menu Items
                if showMenu {
                    VStack(alignment: .trailing) {
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
                    .padding(.trailing, 16) // Align with the button
                }
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
