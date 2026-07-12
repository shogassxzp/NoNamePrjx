import Foundation

protocol NetworkClient {
    func send<Response: Decodable>(_ endpoint: Endpoint) async throws -> Response
}
