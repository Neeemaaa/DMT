import SwiftUI

struct ShelterDetailView: View {
    let shelter: Shelter

    var body: some View {
        VStack(spacing: 20) {
            Text(shelter.name)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            
            Text(shelter.description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Address:")
                .font(.headline)
            
            Text(shelter.address)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle("Shelter Details")
    }
}