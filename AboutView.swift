import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("About Us")
                .font(.largeTitle)
                .padding()

            Text("Developer: Neema Tabarani")
                .font(.title3)

            Text("Professor: Lidia Morrison")
                .font(.title3)

            Text("CPSC 597 FINAL PROJECT")
                .font(.headline)
                .padding(.top)

            Text("© 2025 Pretend Copyright")
                .font(.footnote)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .navigationTitle("About")
        .padding()
    }
}

#Preview {
    AboutView()
}

