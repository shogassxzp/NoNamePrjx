import Foundation

struct MediaFilters: Codable, Hashable {
    var mediaType: MediaType
    var genres: Set<Genre>
    var minimumRating: Double

    static let `default` = MediaFilters(
        mediaType: .movie,
        genres: [],
        minimumRating: 6.0
    )
}
