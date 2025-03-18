import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var locationTrackingEnabled = false
    @State private var username = "NeemaTabs"
    @State private var email = "neematabarani@gmail.com"
    @AppStorage("isDarkMode") private var isDarkMode = false // Store dark mode preference

    var body: some View {
        NavigationView {
            Form {
                // Profile Section
                Section(header: Text("Profile")) {
                    TextField("Username", text: $username)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled(true)
                    
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled(true)
                    
                    NavigationLink(destination: UpdatePasswordView()) {
                        Text("Update Password")
                            .foregroundColor(.blue)
                    }
                }
                
                // Preferences Section
                Section(header: Text("Preferences")) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                    Toggle("Enable Location Tracking", isOn: $locationTrackingEnabled)
                    Toggle("Enable Dark Mode", isOn: $isDarkMode) // Use @AppStorage for dark mode
                }
                
                // Account Actions Section
                Section(header: Text("Account")) {
                    Button(action: resetPreferences) {
                        Text("Reset Preferences")
                            .foregroundColor(.red)
                    }
                    
                    Button(action: deleteAccount) {
                        Text("Delete Account")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }

    // Reset preferences to default values
    private func resetPreferences() {
        notificationsEnabled = false
        locationTrackingEnabled = false
        isDarkMode = false
    }

    // Simulate account deletion
    private func deleteAccount() {
        print("Account deleted")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
