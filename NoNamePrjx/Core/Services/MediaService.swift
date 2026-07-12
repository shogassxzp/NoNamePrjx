import Foundation

protocol MediaService {
    func fetchMedia(filters: MediaFilters) async throws -> [MediaItem]
    func fetchGenres(for mediaType: MediaType) async throws -> [Genre]
}
