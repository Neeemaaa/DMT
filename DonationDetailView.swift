import SwiftUI

struct DonationDetailView: View {
    let organization: Organization

    var body: some View {
        VStack(spacing: 20) {
            Text(organization.name)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            
            Text(organization.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            
            Link("Donate Now", destination: URL(string: organization.donationLink)!)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Donate")
    }
}