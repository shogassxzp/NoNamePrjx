import Foundation

struct MediaItem: Identifiable, Hashable {
    let id: String
    let title: String
    let overview: String
    let posterPath: String?
    let rating: Double
    let releaseYear: String
    let mediaType: MediaType
    let geners: [String]
}
