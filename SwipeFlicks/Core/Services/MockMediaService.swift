import Foundation

struct MockMediaService: MediaService {
    func fetchMedia(filters: MediaFilters = .default) async throws -> [MediaItem] {
        let items = Self.items.filter { item in
            item.mediaType == filters.mediaType && item.rating >= filters.minimumRating
        }

        guard !filters.genres.isEmpty else { return items }

        return items.filter { item in
            !filters.genres.isDisjoint(with: item.genres)
        }
    }

    func fetchGenres(for mediaType: MediaType) async throws -> [Genre] {
        Array(Set(Self.items.filter { $0.mediaType == mediaType }.flatMap(\.genres)))
            .sorted { $0.name < $1.name }
    }

    static let action = Genre(id: 28, name: "Action")
    static let drama = Genre(id: 18, name: "Drama")
    static let sciFi = Genre(id: 878, name: "Science Fiction")
    static let thriller = Genre(id: 53, name: "Thriller")
    static let comedy = Genre(id: 35, name: "Comedy")

    static let items: [MediaItem] = [
        MediaItem(
            id: 155,
            title: "The Dark Knight",
            overview: "Batman faces a criminal mastermind whose chaos tests Gotham and everyone trying to save it.",
            posterPath: nil,
            rating: 9.0,
            releaseYear: 2008,
            mediaType: .movie,
            genres: [action, drama, thriller]
        ),
        MediaItem(
            id: 78,
            title: "Blade Runner",
            overview: "A retired detective hunts synthetic humans through a rain-soaked future Los Angeles.",
            posterPath: nil,
            rating: 8.1,
            releaseYear: 1982,
            mediaType: .movie,
            genres: [sciFi, thriller]
        ),
        MediaItem(
            id: 550,
            title: "Fight Club",
            overview: "An office worker and a soap maker build an underground movement with dangerous consequences.",
            posterPath: nil,
            rating: 8.4,
            releaseYear: 1999,
            mediaType: .movie,
            genres: [drama]
        ),
        MediaItem(
            id: 1396,
            title: "Breaking Bad",
            overview: "A chemistry teacher turns to crime after a diagnosis changes the math of his life.",
            posterPath: nil,
            rating: 8.9,
            releaseYear: 2008,
            mediaType: .tv,
            genres: [drama, thriller]
        ),
        MediaItem(
            id: 2316,
            title: "The Office",
            overview: "A documentary crew follows the everyday absurdity of a paper company branch.",
            posterPath: nil,
            rating: 8.6,
            releaseYear: 2005,
            mediaType: .tv,
            genres: [comedy]
        )
    ]
}
