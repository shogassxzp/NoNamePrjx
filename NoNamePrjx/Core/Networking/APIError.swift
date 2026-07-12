import Foundation

enum APIError: Error, Equatable {
    case invalidURL
    case invalidResponse
    case decodingFailed
    case requestFailed(String)
}
