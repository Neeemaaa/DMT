import SwiftUI

struct IncidentTypeDetailView: View {
    let incidentType: String
    let disasters: [Disaster]

    var disasterTypeColors: [String: Color] = [
        "Fire": .red,
        "Flood": .blue,
        "Tornado": .gray,
        "Hurricane": .orange,
        "Earthquake": .purple,
        "Other": .green
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("\(incidentType) Disasters")
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading)
                    .foregroundColor(disasterTypeColors[incidentType] ?? .black)

                ForEach(disasters, id: \.id) { disaster in
                    NavigationLink(destination: DisasterDetailView(disaster: disaster)) {
                        VStack(alignment: .leading) {
                            Text(disaster.name)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(disaster.location)
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.8))
                            if let declarationDate = disaster.declarationDate {
                                Text("Declared on: \(formatDate(declarationDate))") // Display formatted date
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.8))
                            }
                        }
                        .padding()
                        .background(disasterTypeColors[incidentType] ?? .gray)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("\(incidentType) Disasters")
    }

    private func formatDate(_ isoDate: String) -> String {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        guard let date = formatter.date(from: isoDate) else {
            print("Failed to parse ISO date: \(isoDate)")
            return isoDate
        }
        let outputFormatter = DateFormatter()
        outputFormatter.dateStyle = .long
        outputFormatter.timeStyle = .short
        return outputFormatter.string(from: date)
    }
}

#Preview {
    IncidentTypeDetailView(
        incidentType: "Fire",
        disasters: [
            Disaster(
                name: "Example Fire",
                location: "Example Location",
                description: "This is an example description.",
                coordinates: Coordinates(latitude: 37.7749, longitude: -122.4194),
                declarationDate: "2025-01-10",
                incidentBeginDate: "2024-11-06",
                disasterNumber: 1234,
                state: "CA",
                incidentType: "Fire"
            ),
            Disaster(
                name: "Another Fire",
                location: "Another Location",
                description: "This is another example description.",
                coordinates: Coordinates(latitude: 34.0522, longitude: -118.2437),
                declarationDate: "2025-02-15",
                incidentBeginDate: "2025-01-20",
                disasterNumber: 5678,
                state: "CA",
                incidentType: "Fire"
            )
        ]
    )
}
