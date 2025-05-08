import Foundation

struct OpenFEMADisasterResponse: Codable {
    let DisasterDeclarationsSummaries: [OpenFEMADisaster]
}

struct OpenFEMADisaster: Codable {
    let declarationTitle: String
    let designatedArea: String?
    let incidentType: String?
    let latitude: Double?
    let longitude: Double?
    let declarationDate: String?
    let incidentBeginDate: String?
    let disasterNumber: Int? // Add disasterNumber
    let state: String? // Add state

    enum CodingKeys: String, CodingKey {
        case declarationTitle
        case designatedArea
        case incidentType
        case latitude
        case longitude
        case declarationDate
        case incidentBeginDate
        case disasterNumber
        case state
    }
}
