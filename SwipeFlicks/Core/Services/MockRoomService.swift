import Foundation

struct MockRoomService: RoomService {
    func createRoom(creatorId: String, mediaIds: [Int]) async throws -> Room {
        Room(
            id: UUID().uuidString,
            code: Self.makeRoomCode(),
            creatorId: creatorId,
            guestId: nil,
            status: .waiting,
            mediaIds: mediaIds,
            createdAt: Date()
        )
    }

    func joinRoom(code: String, userId: String) async throws -> Room {
        Room(
            id: code,
            code: code,
            creatorId: "mock-host",
            guestId: userId,
            status: .swiping,
            mediaIds: MockMediaService.items.map(\.id),
            createdAt: Date()
        )
    }

    func sendVote(_ vote: Vote) async throws {}

    func matches(in room: Room, votes: [Vote]) -> [Int] {
        let likedVotes = votes.filter { $0.roomCode == room.code && $0.type == .like }
        let likesByMedia = Dictionary(grouping: likedVotes, by: \.mediaId)

        return room.mediaIds.filter { mediaId in
            let users = Set(likesByMedia[mediaId, default: []].map(\.userId))
            return users.count >= 2
        }
    }

    static func makeRoomCode() -> String {
        String((0..<6).map { _ in "ABCDEFGHJKLMNPQRSTUVWXYZ23456789".randomElement()! })
    }
}
