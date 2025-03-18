import SwiftUI

struct DisasterDetailView: View {
    let disaster: Disaster

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(disaster.name)
                .font(.largeTitle)
                .bold()
            
            Text("Location: \(disaster.location)")
                .font(.title3)
            
            Text("Distance: \(disaster.distance) miles away")
                .font(.title3)
            
            Text("Description:")
                .font(.headline)
            
            Text(disaster.description)
                .font(.body)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Disaster Details")
    }
}

#Preview {
    DisasterDetailView(disaster: Disaster(name: "Example Disaster", location: "Example Location", distance: 100, description: "This is an example description."))
}