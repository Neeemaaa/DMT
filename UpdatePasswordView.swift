import SwiftUI

struct UpdatePasswordView: View {
    @State private var currentPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    @State private var errorMessage = ""

    var body: some View {
        Form {
            Section(header: Text("Current Password")) {
                SecureField("Enter Current Password", text: $currentPassword)
            }
            
            Section(header: Text("New Password")) {
                SecureField("Enter New Password", text: $newPassword)
                SecureField("Confirm New Password", text: $confirmPassword)
            }
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            Button(action: updatePassword) {
                Text("Update Password")
                    .foregroundColor(.blue)
            }
        }
        .navigationTitle("Update Password")
    }

    private func updatePassword() {
        guard !currentPassword.isEmpty else {
            errorMessage = "Current password is required."
            return
        }
        
        guard newPassword == confirmPassword else {
            errorMessage = "Passwords do not match."
            return
        }
        
        // Simulate password update
        print("Password updated successfully!")
        errorMessage = ""
    }
}

struct UpdatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        UpdatePasswordView()
    }
}