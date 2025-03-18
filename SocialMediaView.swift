import SwiftUI

struct SocialMediaView: View {
    var body: some View {
        VStack {
            Text("Social Media & Updates")
                .font(.largeTitle)
                .padding()
            
            Text("Stay updated with the latest disaster news and social media posts.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
        }
        .navigationTitle("Updates")
    }
}

#Preview {
    SocialMediaView()
}