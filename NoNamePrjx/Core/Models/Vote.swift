import Foundation

struct Vote: Identifiable, Codable, Hashable {
    let id: String
    let roomCode: String?
    let userId: String
    let mediaId: Int
    let type: VoteType
    let createdAt: Date
}

enum VoteType: String, Codable, Hashable {
    case like
    case dislike
}
