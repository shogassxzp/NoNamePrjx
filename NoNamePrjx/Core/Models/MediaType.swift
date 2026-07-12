import Foundation

enum MediaType: String, Codable, CaseIterable, Hashable {
    case movie
    case tv

    var title: String {
        switch self {
        case .movie:
            return "Movie"
        case .tv:
            return "TV Show"
        }
    }
}
