import Foundation

struct MediaItem: Identifiable, Codable, Hashable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let rating: Double
    let releaseYear: Int?
    let mediaType: MediaType
    let genres: [Genre]

    var displayYear: String {
        guard let releaseYear else { return "Unknown" }
        return String(releaseYear)
    }
}
