import Foundation

struct Room: Identifiable, Codable, Hashable {
    let id: String
    let code: String
    let creatorId: String
    let guestId: String?
    let status: RoomStatus
    let mediaIds: [Int]
    let createdAt: Date
}

enum RoomStatus: String, Codable, Hashable {
    case waiting
    case swiping
    case closed
}
