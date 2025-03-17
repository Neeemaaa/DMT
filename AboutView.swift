import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("About Page")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle("About")
    }
}

#Preview {
    AboutView()
}

