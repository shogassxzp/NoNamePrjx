import Foundation

struct Room: Identifiable, Codable {
    let id: String
    let creatorId: String
    let guestId: String?
    let status: RoomStatus
}

enum RoomStatus: String, Codable {
    case waiting
    case swiping
    case closed
}
