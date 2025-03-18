import Foundation

struct Organization: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let donationLink: String
}

struct Shelter: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let address: String
}
