import Foundation

protocol RoomService {
    func createRoom(creatorId: String, mediaIds: [Int]) async throws -> Room
    func joinRoom(code: String, userId: String) async throws -> Room
    func sendVote(_ vote: Vote) async throws
    func matches(in room: Room, votes: [Vote]) -> [Int]
}
