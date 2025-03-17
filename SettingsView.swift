import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var locationTrackingEnabled = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Preferences")) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                    Toggle("Enable Location Tracking", isOn: $locationTrackingEnabled)
                }
                Section {
                    Button(action: resetPreferences) {
                        Text("Reset Preferences")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }

    private func resetPreferences() {
        notificationsEnabled = false
        locationTrackingEnabled = false
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
